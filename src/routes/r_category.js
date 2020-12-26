const router = require("express").Router();
const { getCategoryByIdRedis } = require("../middleware/redis");
const { getCategory, getCategoryById } = require("../controller/c_category");

router.get("/", getCategory);
router.get("/:id", getCategoryByIdRedis, getCategoryById);

module.exports = router;
