const createDBConnection = require('../configs/mysqlConnection')

async function addNewTodo({ todo, userId }) {
  const dbConnection = await createDBConnection()

  const sql = 'INSERT INTO todo (todoId, todo, userId) VALUES (?, ?, ?)'
  const [rows] = await dbConnection.execute(sql, [
    crypto.randomUUID(),
    todo,
    userId,
  ])

  const response = {
    ok: rows.length !== 0 ? true : false,
    message: 'Task created successfully !',
    result: rows,
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

module.exports = {
  addNewTodo,
  findUser,
}
