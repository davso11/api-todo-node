const express = require('express')
const cors = require('cors')

const app = express()

app.use(express.json())
app.use(cors())

app.use('/api/ping', (req, res) => {
  res.status(200).json({ message: 'Got you !' })
})

module.exports = app
