const express = require('express')
const cors = require('cors')
const todoRoutes = require('./routes/todo-routes')

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cors())

app.use('/api/todos', todoRoutes)

module.exports = app
