const router = require("express").Router();
const {
  getPromocode,
  getPromocodeById,
  postPromocode,
  patchPromocode,
  deletePromocode,
} = require("../controller/c_promocode");
const {
  getPromocodeRedis,
  getPromocodeByIdRedis,
  clearDataPromocodeRedis,
} = require("../middleware/redis");

router.get("/", getPromocodeRedis, getPromocode);
router.get("/:id", getPromocodeByIdRedis, getPromocodeById);
router.post("/", clearDataPromocodeRedis, postPromocode);
router.patch("/:id", clearDataPromocodeRedis, patchPromocode);
router.delete("/:id", clearDataPromocodeRedis, deletePromocode);

module.exports = router;
