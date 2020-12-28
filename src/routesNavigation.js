const router = require("express").Router();
const product = require("./routes/r_product");
const category = require("./routes/r_category");
const promocode = require("./routes/r_promocode");
const history = require("./routes/r_history");
const users = require("./routes/r_users");
const checkout = require("./routes/r_checkout");

router.use("/product", product);
router.use("/category", category);
router.use("/promocode", promocode);
router.use("/history", history);
router.use("/users", users);
router.use("/checkout", checkout);
module.exports = router;
