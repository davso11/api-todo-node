if (process.env.NODE_ENV === 'development') require('dotenv').config()
const http = require('node:http')
const app = require('./app')

const PORT = process.env.PORT

app.set('port', PORT)

const server = http.createServer(app)

server.listen(PORT, () => {
  console.log(`Server is running on http://127.0.0.1:${PORT}`)
})
