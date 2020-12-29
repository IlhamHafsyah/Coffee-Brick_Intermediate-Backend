const router = require("express").Router();
const {
  todayIncome,
  perWeek,
  yearIncome,
} = require("../controller/c_dashboard");

router.get("/ti", todayIncome);
router.get("/pw", perWeek);
router.get("/yi", yearIncome);

module.exports = router;
