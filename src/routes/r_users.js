const router = require('express').Router()
const uploadImage = require('../middleware/multerprofile')
const { authorization } = require('../middleware/auth')
const {
  registerUsers,
  loginUsers,
  getUsers,
  getUsersById,
  patchUsers,
  deleteUsers
} = require('../controller/c_users')
const {
  getUsersRedis,
  getUsersByIdRedis,
  ClearDataUsersRedis
} = require('../middleware/redis')

router.get('/', authorization, getUsersRedis, getUsers)
router.get('/:id', authorization, getUsersByIdRedis, getUsersById)
router.post('/register', uploadImage, registerUsers)
router.post('/login', loginUsers)
router.patch(
  '/:id',
  authorization,
  ClearDataUsersRedis,
  uploadImage,
  patchUsers
)
router.delete('/:id', authorization, ClearDataUsersRedis, deleteUsers)

module.exports = router
