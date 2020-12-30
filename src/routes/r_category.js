const router = require('express').Router()
const { authorization } = require('../middleware/auth')
const { getCategoryByIdRedis } = require('../middleware/redis')
const { getCategory, getCategoryById } = require('../controller/c_category')

router.get('/', authorization, getCategory)
router.get('/:id', authorization, getCategoryByIdRedis, getCategoryById)

module.exports = router
