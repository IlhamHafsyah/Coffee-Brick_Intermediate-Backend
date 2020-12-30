const router = require("express").Router();
const { authorization, authentication } = require("../middleware/auth");
const {
  getHistory,
  getDetailhistory,
  postHistory,
  postDetailhistory,
  patchHistory,
  deleteHistory,
} = require("../controller/c_history");
const {
  getHistoryByIdRedis,
  getDetailhistoryByIdRedis,
  clearDataHistoryRedis,
} = require("../middleware/redis");

router.get("/:id", authorization, getHistoryByIdRedis, getHistory);
router.get(
  "/dh/:id",
  authorization,
  getDetailhistoryByIdRedis,
  getDetailhistory
);
router.post("/", authorization, clearDataHistoryRedis, postHistory);
router.post("/detail", authorization, clearDataHistoryRedis, postDetailhistory);
router.patch(
  "/:id",
  authorization,
  authentication,
  clearDataHistoryRedis,
  patchHistory
);
router.delete("/:id", authorization, clearDataHistoryRedis, deleteHistory);

module.exports = router;
