'use strict';
let db = require('../config/database.js');

module.exports = {
  createTask: (task, callback) => {
    console.log(task);
    db.query('insert into tasks set ?', task, (error, result) => {
      if (!error) {
        let data = {
          task_id: result.insertId,
          task_title: task.task_title,
          project_id: task.project_id,
          user_id: task.user_id,
        };
        callback(0, data);
      } else callback(error);
    });
  },
  deleteTask: (user_id, task_id, callback) => {
    module.exports.taskAuth(user_id, task_id, (err, result) => {
      if (err) callback(err);
      else if (result === true) {
        db.query(
          'delete from tasks where task_id = ?',
          [task_id],
          (error, result) => {
            if (!error) callback(0, true);
            else callback(error);
          }
        );
      } else callback(0, false);
    });
  },
  viewTask: (task_id, callback) => {
    module.exports.checkTaskExist(task_id, (err, result) => {
      if (err) {
        callback(err);
      } else {
        if (result === true) {
          db.query(
            'select * from tasks where task_id = ?',
            [task_id],
            (error, result) => {
              if (!error) {
                callback(0, result);
              } else callback(error);
            }
          );
        } else {
          callback(0, false);
        }
      }
    });
  },
  viewAllTasks: (callback) => {
    db.query('select * from tasks', (error, result) => {
      if (!error) {
        callback(0, result);
      } else callback(error);
    });
  },
  searchproduct: (search_query, offset, callback) => {
    db.query(
      'select product_name, product_desc,product_url,product_price,date_added from products where product_name like ' +
        db.escape('%' + search_query + '%') +
        'limit 1 offset ' +
        offset,
      function (error, result) {
        if (!error) {
          callback(0, result);
        } else console.log(error);
      }
    );
  },
  updateTask: (task, callback) => {
    module.exports.taskAuth(task.task_id, (err, result) => {
      if (err) {
        callback(error);
      } else {
        if (result === true) {
          console.log(task);
          db.query(
            'update tasks set ? where task_id = ?',
            [
              {
                task_title: task.task_title,
                project_id: task.project_id,
                user_id: task.user_id,
                status_id: task.status_id,
              },
              task.task_id,
            ],
            (error, result) => {
              if (!error) {
                callback(0, result);
              } else callback(error);
            }
          );
        } else {
          callback(0, false);
        }
      }
    });
  },
  filterTask: (task, callback) => {
    let sql = 'select * from tasks';
    if (task.keyword === undefined) task.keyword = '';
    sql += ` where task_title like '%${task.keyword}%'`;
    if (
      task.project_id !== undefined ||
      task.user_id !== undefined ||
      task.status_id !== undefined
    ) {
      if (task.project_id !== undefined)
        sql += ` and project_id = ${task.project_id}`;
      if (task.user_id !== undefined) sql += ` and user_id = ${task.user_id}`;
      if (task.status_id !== undefined) sql += ` and status_id = ${task.status_id}`;
    }
    db.query(sql, (error, result) => {
      if (!error) {
        callback(0, result);
      } else callback(error);
    });
  },
  taskAuth: function (task_id, callback) {
    db.query(
      'select count(*) as task_count from tasks where task_id = ?',
      [task_id],
      (error, rows) => {
        if (!error) {
          if (rows[0].task_count) {
            callback(0, true);
          } else {
            callback(0, false);
          }
        } else callback(error);
      }
    );
  },
  checkTaskExist: function (task_id, callback) {
    db.query(
      'select count(*) as task_count from tasks where task_id = ?',
      [task_id],
      (error, rows) => {
        if (!error) {
          if (rows[0].task_count) {
            callback(0, true);
          } else {
            callback(0, false);
          }
        } else callback(error);
      }
    );
  },
};
