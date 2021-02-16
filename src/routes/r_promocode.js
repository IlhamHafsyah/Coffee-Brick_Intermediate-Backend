const router = require('express').Router()
const uploadImage = require('../middleware/multerpromo')
const { authorization, authentication } = require('../middleware/auth')
const {
  getPromocode,
  getPromocodeById,
  postPromocode,
  patchPromocode,
  deletePromocode
} = require('../controller/c_promocode')
const {
  getPromocodeRedis,
  getPromocodeByIdRedis,
  clearDataPromocodeRedis
} = require('../middleware/redis')

router.get('/', authorization, getPromocode)
router.get('/:id', authorization, getPromocodeByIdRedis, getPromocodeById)
router.post(
  '/',
  authorization,
  authentication,
  clearDataPromocodeRedis,
  uploadImage,
  postPromocode
)
router.patch(
  '/:id',
  authorization,
  authentication,
  clearDataPromocodeRedis,
  uploadImage,
  patchPromocode
)
router.delete(
  '/:id',
  authorization,
  authentication,
  clearDataPromocodeRedis,
  deletePromocode
)

module.exports = router
