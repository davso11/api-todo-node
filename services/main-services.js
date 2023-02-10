const createDBConnection = require('../configs/mysqlConnection')

async function addNewTodo({ todo, userId, isImportant }) {
  console.log({ todo, userId, isImportant })

  const dbConnection = await createDBConnection()
  const sql =
    'INSERT INTO todo (todoId, todo, isImportant, userId) VALUES (?, ?, ?, ?)'

  const todoId = crypto.randomUUID()
  const todoObj = { todoId, todo: todo.toString(), isImportant, userId }
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
    'SELECT todoId, todo, updatedAt, isImportant FROM todo WHERE userId = ? ORDER BY updatedAt DESC'
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

async function filterByStatus({ status, userId }) {
  const dbConnection = await createDBConnection()
  const sql =
    'SELECT todoId, todo, updatedAt, isImportant FROM todo WHERE isImportant = ? AND userId = ? ORDER BY updatedAt DESC'
  const result = await dbConnection.execute(sql, [status, userId])

  const response = {
    ok: result.length !== 0 ? true : false,
    result: result[0],
  }

  await dbConnection.end()
  return response
}

module.exports = {
  addNewTodo,
  findUser,
  getAllTodos,
  removeTodo,
  filterByStatus,
}
