const router = require("express").Router();
const {
  todayIncome,
  perWeek,
  yearIncome,
  perMonth,
} = require("../controller/c_dashboard");

router.get("/ti", todayIncome);
router.get("/pw", perWeek);
router.get("/yi", yearIncome);
router.get("/pm", perMonth);

module.exports = router;
