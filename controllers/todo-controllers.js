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

    return res.status(201).json(creationResp)
  } catch (e) {
    console.log(e)
  }
}

function removeTodo(req, res) {
  // ...
}

module.exports = {
  createTodo,
  removeTodo,
}
