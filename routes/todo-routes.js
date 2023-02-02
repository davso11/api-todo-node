const express = require('express')
const todoControllers = require('../controllers/todo-controllers')
const { auth } = require('../middlewares/auth-middleware')

const router = express.Router()

router.post('/', auth, todoControllers.createTodo)
router.delete('/:todoId', auth, todoControllers.removeTodo)

module.exports = router
