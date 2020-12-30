const router = require('express').Router()
const { authorization, authentication } = require('../middleware/auth')
const {
  todayIncome,
  perWeek,
  yearIncome,
  perMonth
} = require('../controller/c_dashboard')

router.get('/ti', authorization, authentication, todayIncome)
router.get('/pw', authorization, authentication, perWeek)
router.get('/yi', authorization, authentication, yearIncome)
router.get('/pm', authorization, authentication, perMonth)

module.exports = router
