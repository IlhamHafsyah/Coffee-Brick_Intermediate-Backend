const router = require('express').Router()
const { authorization } = require('../middleware/auth')
const { getCheckout } = require('../controller/c_checkout')

router.get('/:id', authorization, getCheckout)

module.exports = router
