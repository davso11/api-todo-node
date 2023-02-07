const services = require('../services/main-services')

async function auth(req, res, next) {
  try {
    const userId = req.body.userId ?? req.params.userId

    if (!userId) {
      return res.status(400).json({
        message: 'Must provide a user identifier',
      })
    }

    const user = await services.findUser(userId)

    if (!user || user.length === 0) {
      return res.status(401).json({ message: 'Invalid user identifier !' })
    }

    next()
  } catch (e) {
    console.log(e)
  }
}

module.exports = { auth }
