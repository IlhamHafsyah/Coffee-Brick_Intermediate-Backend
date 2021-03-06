const helper = require('../helper/response')
const redis = require('redis')
const client = redis.createClient()

module.exports = {
  getProductByIdRedis: (request, response, next) => {
    const { id } = request.params
    client.get(`CBgetproductbyid:${id}`, (error, result) => {
      if (!error && result != null) {
        return helper.response(
          response,
          200,
          'Success Get Product By Id',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  getProductRedis: (req, res, next) => {
    client.get(`CBgetproduct:${JSON.stringify(req.query)}`, (error, result) => {
      if (!error && result != null) {
        const newResult = JSON.parse(result)
        return helper.response(
          res,
          200,
          'Success Get Product',
          newResult.result,
          newResult.pageInfo
        )
      } else {
        next()
      }
    })
  },
  clearDataProductRedis: (req, res, next) => {
    client.keys('CB*', (_error, result) => {
      if (result.length > 0) {
        result.forEach((value) => {
          client.del(value)
        })
      }
      next()
    })
  },
  getCategoryByIdRedis: (req, res, next) => {
    const { id } = req.params
    client.get(`getcategorybyid:${id}`, (error, result) => {
      if (!error && result != null) {
        return helper.response(
          res,
          200,
          'Success Get Category By Id',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  getPromocodeRedis: (req, res, next) => {
    client.get('getpromocode', (error, result) => {
      if (!error && result != null) {
        return helper.response(
          res,
          200,
          'Success Get Promocode',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  getPromocodeByIdRedis: (req, res, next) => {
    const { id } = req.params
    client.get(`getpromocodebyid:${id}`, (error, result) => {
      if (!error && result != null) {
        return helper.response(
          res,
          200,
          'Success Get Promo Code By Id',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  clearDataPromocodeRedis: (req, res, next) => {
    client.keys('getpromocode*', (_error, result) => {
      if (result.length > 0) {
        result.forEach((value) => {
          client.del(value)
        })
      }
      next()
    })
  },
  getHistoryByIdRedis: (req, res, next) => {
    const { id } = req.params
    client.get(`gethistorybyid:${id}`, (error, result) => {
      if (!error && result != null) {
        return helper.response(
          res,
          200,
          'Success Get History By Id',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  getDetailhistoryByIdRedis: (req, res, next) => {
    const { id } = req.params
    client.get(`getdetailhistorybyid:${id}`, (error, result) => {
      if (!error && result != null) {
        return helper.response(
          res,
          200,
          'Success Get Detail History By Id',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  clearDataHistoryRedis: (req, res, next) => {
    client.keys('gethistory*', (_error, result) => {
      if (result.length > 0) {
        result.forEach((value) => {
          client.del(value)
        })
      }
      next()
    })
  },
  getUsersRedis: (req, res, next) => {
    client.get('getusers', (error, result) => {
      if (!error && result != null) {
        return helper.response(
          res,
          200,
          'Success Get Promocode',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  getUsersByIdRedis: (req, res, next) => {
    const { id } = req.params
    client.get(`getusersbyid:${id}`, (error, result) => {
      if (!error && result != null) {
        return helper.response(
          res,
          200,
          'Success Get Promocode',
          JSON.parse(result)
        )
      } else {
        next()
      }
    })
  },
  ClearDataUsersRedis: (req, res, next) => {
    client.keys('getusers*', (_error, result) => {
      if (result.length > 0) {
        result.forEach((value) => {
          client.del(value)
        })
      }
      next()
    })
  }
}
