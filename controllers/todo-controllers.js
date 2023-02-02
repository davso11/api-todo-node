const services = require('../services/main-services')

async function createTodo(req, res) {
  try {
    if (!req.body.todo) {
      return res.status(400).json({
        message: 'Missing paramater `todo` in the request body',
      })
    }

    const creationResp = await services.addNewTodo(req.body)
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

module.exports = {
  createTodo,
  removeTodo,
}
