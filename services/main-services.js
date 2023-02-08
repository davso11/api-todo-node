const createDBConnection = require('../configs/mysqlConnection')

async function addNewTodo({ todo, userId }) {
  const dbConnection = await createDBConnection()
  const sql = 'INSERT INTO todo (todoId, todo, userId) VALUES (?, ?, ?)'

  const todoId = crypto.randomUUID()
  const todoObj = { todoId, todo, userId }
  const [rows] = await dbConnection.execute(sql, Object.values(todoObj))

  const response = {
    ok: rows.length !== 0 ? true : false,
    message: 'Task created successfully !',
    todoObj,
  }

  await dbConnection.end()
  return response
}

async function findUser(userId) {
  const dbConnection = await createDBConnection()
  const sql = 'SELECT userId FROM user WHERE userId = ?'
  const [rows] = await dbConnection.execute(sql, [userId])

  await dbConnection.end()
  return rows
}

async function getAllTodos(userId) {
  const dbConnection = await createDBConnection()
  const sql =
    'SELECT todoId, todo, updatedAt FROM todo WHERE userId = ? ORDER BY updatedAt DESC'
  const [rows] = await dbConnection.execute(sql, [userId])

  await dbConnection.end()
  return rows
}

async function removeTodo(todoId) {
  const dbConnection = await createDBConnection()
  const sql = 'DELETE FROM todo WHERE todoId = ?'
  const result = await dbConnection.execute(sql, [todoId])

  const response = {
    ok: result.length !== 0 ? true : false,
    message: 'Task deletes successfully !',
    result: result,
  }

  await dbConnection.end()
  return response
}

async function updateTodoStatus({ isImportant, todoId }) {
  const dbConnection = await createDBConnection()
  const sql = 'UPDATE todo SET isImportant = ? WHERE todoId = ?'
  const result = await dbConnection.execute(sql, [isImportant, todoId])

  const response = {
    ok: result.length !== 0 ? true : false,
    message: 'Task status updated successfully !',
    result: result,
  }

  await dbConnection.end()
  return response
}

module.exports = {
  addNewTodo,
  findUser,
  getAllTodos,
  removeTodo,
  updateTodoStatus,
}
