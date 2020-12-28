const router = require("express").Router();
const { getCheckout } = require("../controller/c_checkout");

router.get("/:id", getCheckout);

module.exports = router;
