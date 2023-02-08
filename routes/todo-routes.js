const express = require('express')
const todoControllers = require('../controllers/todo-controllers')
const { auth } = require('../middlewares/auth-middleware')

const router = express.Router()

router.get('/:userId', auth, todoControllers.getTodos)
router.post('/status', auth, todoControllers.filter)
router.post('/', auth, todoControllers.createTodo)
router.delete('/:todoId', auth, todoControllers.removeTodo)

module.exports = router
