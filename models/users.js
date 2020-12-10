const bcrypt = require('bcrypt')
const db = require('../config/database.js')

module.exports = {
  signUp: (userData, callback) => {
    userData.auth_token = module.exports.generateAuthToken()
    userData.password = bcrypt.hashSync(userData.password, 10)
    db.query('INSERT INTO users SET ?', userData, (error, result) => {
      if (!error) {
        const data = {
          user_id: result.insertId,
          username: userData.username,
          auth_token: userData.auth_token,
        }
        callback(0, data)
      } else callback(error)
    })
  },
  login: (userData, callback) => {
    const accessToken = module.exports.generateAuthToken()
    db.query('select id, password from users where username = ?', userData.username, (error, result) => {
      if (!error) {
        if (result.length > 0) {
          const hashPassword = result[0].password
          if (bcrypt.compareSync(userData.password, hashPassword)) {
            db.query('insert into sessions set ?', { user_id: result[0].id, access_token: accessToken }, (error) => {
              if (!error) {
                callback(0, {
                  id: result[0].id,
                  username: userData.username,
                  access_token: accessToken,
                })
              } else callback(error)
            })
          } else {
            callback(0, {
              message: 'password is not matched',
            })
          }
        }
      }
    })
    // db.query(
    //   'select id, username from users where username = ? and password = ?',
    //   [userData.username, userData.password],
    //   (error, result) => {
    //     if (!error) {
    //       if (result.length > 0) {
    //         const data = result[0]
    //         db.query('insert into sessions set ?',
    //         { user_id: data.id, access_token: accessToken }, (error) => {
    //           if (!error) {
    //             callback(0, { ...data, access_token: accessToken })
    //           } else callback(error)
    //         })
    //       } else callback(error)
    //     }
    //   },
    // )
  },
  logOut: (token, callback) => {
    db.query(
      'delete from sessions where access_token = ?',
      [token],
      (error) => {
        if (!error) callback(0, true)
        else callback(error)
      },
    )
  },
  getUserInfo: (userData, callback) => {
    db.query(
      'select username from users where id = ?',
      [userData],
      (error, result) => {
        if (!error) {
          if (result.length > 0) callback(0, result)
        } else callback(error)
      },
    )
  },
  generateAuthToken: () => {
    const chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$&'
    let result = ''
    for (let i = 32; i > 0; --i) { result += chars[Math.floor(Math.random() * chars.length)] }
    return result
  },
}
