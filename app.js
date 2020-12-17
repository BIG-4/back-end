const http = require('http')
const env = require('./config/env')
const routing = require('./routes')
const { decodeURI } = require('./utils/security')

const baseURI = `http://localhost:${env.PORT || 2000}`

console.log(`Server listen on ${baseURI}`)
http.createServer((request, response) => {
  const url = new URL(baseURI + decodeURI(request.url))

  response.setHeader('Access-Control-Allow-Origin', '*')
  response.setHeader('Access-Control-Request-Method', '*')
  response.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET')
  response.setHeader('Access-Control-Allow-Headers', '*')

  if (request.method === 'OPTIONS') {
    response.writeHead(200)
    response.end()
  }

  routing(url, request, response)
}).listen(env.PORT || 2000)
