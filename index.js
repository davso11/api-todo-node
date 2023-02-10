if (process.env.NODE_ENV === 'development') require('dotenv').config()
const http = require('node:http')
const app = require('./app')

const PORT = process.env.PORT

app.set('port', PORT)

const server = http.createServer(app)

server.listen(PORT, '192.168.252.203', () => {
  console.log(`Server is running on http://192.168.252.203:${PORT}`)
})
