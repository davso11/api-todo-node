const services = require('../services/main-services')

async function createTodo(req, res) {
  const isImportant = req.body.isImportant ?? '0'

  try {
    if (!req.body.todo) {
      return res.status(400).json({
        message: 'Missing paramater `todo` in the request body',
      })
    }

    const todoObj = { ...req.body, isImportant }
    const creationResp = await services.addNewTodo(todoObj)
    if (!creationResp.ok) {
      return res.status(424).json({
        message: 'Cannot achieve that request',
      })
    }

    res.status(201).json(creationResp)
  } catch (e) {
    console.log(e)
  }
}

async function getTodos(req, res) {
  try {
    const { userId } = req.params

    if (!userId) {
      return res.status(400).json({
        message: 'Must provide a user identifier',
      })
    }

    const getResp = await services.getAllTodos(userId)

    if (!getResp || getResp.length === 0) {
      return res.status(424).json({
        message: 'Cannot achieve that request',
      })
    }

    res.status(200).json(getResp)
  } catch (e) {
    console.log('GetTodo controller error ', e)
  }
}

async function removeTodo(req, res) {
  try {
    const deletionResp = await services.removeTodo(req.params.todoId)
    if (!deletionResp.ok) {
      return res.status(424).json({
        message: 'Cannot achieve that request',
      })
    }

    res.status(204).end()
  } catch (e) {
    console.log(e)
  }
}

async function filter(req, res) {
  const { status } = req.body

  try {
    if (!status) {
      return res.status(400).json({
        message: 'Missing paramater `status` in the request body',
      })
    }

    const filterResp = await services.filterByStatus(req.body)

    if (!filterResp.ok) {
      return res.status(424).json({
        message: 'Cannot achieve that request',
      })
    }

    res.status(200).json(filterResp)
  } catch (e) {
    console.log(e)
  }
}

module.exports = {
  getTodos,
  createTodo,
  removeTodo,
  filter,
}
