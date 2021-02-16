const {
  getPromocodeModel,
  getPromocodeByIdModel,
  postPromocodeModel,
  patchPromocodeModel,
  deletePromocodeModel,
  getPromoCountModel
} = require('../model/m_promocode')
const redis = require('redis')
const client = redis.createClient()
const helper = require('../helper/response')
const qs = require('querystring')
const fs = require('fs')

module.exports = {
  getPromocode: async (req, res) => {
    try {
      console.log('get promo jalan')
      let { page } = req.query
      page = parseInt(page)
      console.log(req.query)
      const limit = 1
      console.log(limit)
      const totalData = await getPromoCountModel()
      const totalPage = Math.ceil(totalData / limit)
      const offset = page * limit - limit
      console.log(offset)
      const prevLink =
        page > 1 ? qs.stringify({ ...req.query, ...{ page: page - 1 } }) : null
      const nextLink =
        page < totalPage
          ? qs.stringify({ ...req.query, ...{ page: page + 1 } })
          : null
      console.log(page)
      console.log(totalPage)
      console.log(limit)
      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData,
        nextLink: nextLink && `http://localhost:4001/product?${nextLink}`,
        prevLink: prevLink && `http://localhost:4001/product?${prevLink}`
      }
      const result = await getPromocodeModel(limit, offset)
      client.setex('getpromocode', 3600, JSON.stringify(result))
      return helper.response(res, 200, 'Success Get Category', result, pageInfo)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getPromocodeById: async (req, res) => {
    try {
      const { id } = req.params
      const result = await getPromocodeByIdModel(id)
      if (result.length > 0) {
        client.setex(`getpromocodebyid:${id}`, 3600, JSON.stringify(result))
        return helper.response(res, 200, 'Success Get Category By Id', result)
      } else {
        return helper.response(res, 404, `Product By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  postPromocode: async (req, res) => {
    try {
      const {
        promocode_name,
        promocode_discount,
        minimum_purchase,
        valid_until,
        promocode_status
      } = req.body
      if (
        promocode_name == null ||
        promocode_discount == null ||
        promocode_status == null
      ) {
        console.log('All data must be filled in')
      } else {
        const setData = {
          promocode_name,
          promocode_image: req.file === undefined ? '' : req.file.filename,
          promocode_discount,
          minimum_purchase,
          valid_until,
          promocode_updated_at: new Date(),
          promocode_status
        }
        const result = await postPromocodeModel(setData)
        return helper.response(res, 200, 'Success Post Product', result)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  patchPromocode: async (req, res) => {
    try {
      const { id } = req.params
      // const getName = await getPromocodeByIdModel(id)
      // const name = getName[0].promocode_image
      // fs.unlink(`./upload/${name}`, function (err) {
      //   if (err) {
      //     console.log('Error while deleting the file' + err)
      //   }
      // })
      const {
        promocode_name,
        promocode_status,
        minimum_purchase,
        valid_until,
        promocode_discount
      } = req.body
      if (
        promocode_name == null ||
        promocode_discount == null ||
        promocode_status == null
      ) {
        console.log('All data must be filled in')
      } else {
        const setData = {
          promocode_name,
          promocode_image: req.file === undefined ? '' : req.file.filename,
          promocode_discount,
          minimum_purchase,
          valid_until,
          promocode_created_at: new Date(),
          promocode_status
        }
        const checkId = await getPromocodeByIdModel(id)
        if (checkId.length > 0) {
          const result = await patchPromocodeModel(setData, id)
          return helper.response(res, 200, 'Success Patch Promo Code', result)
        } else {
          return helper.response(res, 404, `Product By Id : ${id} Not Found`)
        }
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  deletePromocode: async (req, res) => {
    try {
      const { id } = req.params
      const getName = await getPromocodeByIdModel(id)
      const name = getName[0].promocode_image
      fs.unlink(`./upload/${name}`, function (err) {
        if (err) {
          console.log('Error while deleting the file' + err)
        }
      })
      const result = await deletePromocodeModel(id)
      if (result.length == null) {
        return helper.response(
          res,
          200,
          `Success Delete Promo Code By Id : Promo Code ${id} deleted`
        )
      } else {
        return helper.response(res, 404, `Promo Code By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
