const router = require("express").Router();
const {
  registerUsers,
  loginUsers,
  getUsers,
  getUsersById,
  patchUsers,
  deleteUsers,
} = require("../controller/c_users");

router.get("/", getUsers);
router.get("/:id", getUsersById);
router.post("/register", registerUsers);
router.post("/login", loginUsers);
router.patch("/:id", patchUsers);
router.delete("/:id", deleteUsers);

module.exports = router;
