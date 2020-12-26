const router = require("express").Router();
const {
  getHistory,
  postHistory,
  postDetailhistory,
  deleteHistory,
} = require("../controller/c_history");
const {
  getHistoryByIdRedis,
  clearDataHistoryRedis,
} = require("../middleware/redis");

router.get("/:id", getHistoryByIdRedis, getHistory);
router.post("/", clearDataHistoryRedis, postHistory);
router.post("/detail", clearDataHistoryRedis, postDetailhistory);
router.delete("/:id", clearDataHistoryRedis, deleteHistory);

module.exports = router;
