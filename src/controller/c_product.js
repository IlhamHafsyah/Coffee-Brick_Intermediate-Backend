const {
  getProductModel,
  getProductCountModel,
  getProductByIdModel,
  postProductModel,
  patchProductModel,
  deleteProductModel
} = require('../model/m_product')
const helper = require('../helper/response')
const qs = require('querystring')
const redis = require('redis')
const client = redis.createClient()
const fs = require('fs')

module.exports = {
  getProduct: async (request, response) => {
    try {
      const totalData = await getProductCountModel()
      let { page, limit, search, sort, id } = request.query
      page = parseInt(page)
      const a = page
      const b = sort
      limit = parseInt(limit)
      if (search === '') {
        page = a
      } else {
        page = 1
        limit = totalData
      }
      if (sort === '') {
        sort = 'product_id'
      } else {
        page = 1
        limit = totalData
        sort = b
      }
      const totalPage = Math.ceil(totalData / limit)
      const offset = page * limit - limit
      const prevLink =
        page > 1
          ? qs.stringify({ ...request.query, ...{ page: page - 1 } })
          : null
      const nextLink =
        page < totalPage
          ? qs.stringify({ ...request.query, ...{ page: page + 1 } })
          : null
      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData,
        nextLink: nextLink && `http://localhost:4001/product?${nextLink}`,
        prevLink: prevLink && `http://localhost:4001/product?${prevLink}`
      }
      const result = await getProductModel(limit, offset, search, sort, id)
      const newData = { result, pageInfo }
      client.setex(
        `getproduct:${JSON.stringify(request.query)}`,
        3600,
        JSON.stringify(newData)
      )
      return helper.response(
        response,
        200,
        'Success Get Product',
        result,
        pageInfo
      )
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  getProductById: async (request, response) => {
    try {
      const { id } = request.params
      const result = await getProductByIdModel(id)
      if (result.length > 0) {
        client.setex(`getproductbyid:${id}`, 3600, JSON.stringify(result))
        return helper.response(
          response,
          200,
          'Success Get Product By Id',
          result
        )
      } else {
        return helper.response(response, 404, `Product By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  postProduct: async (request, response) => {
    try {
      const {
        category_id,
        product_name,
        product_price,
        product_stock,
        product_desc,
        size_r,
        size_l,
        size_xl,
        size_250,
        size_300,
        size_500,
        home_delivery,
        dine_in,
        take_away,
        start_hour,
        end_hour,
        product_status
      } = request.body
      // if (
      //   category_id == null ||
      //   product_name == null ||
      //   product_price == null ||
      //   product_stock == null ||
      //   product_desc == null ||
      //   home_delivery == null ||
      //   dine_in == null ||
      //   take_away == null ||
      //   product_status == null
      // ) {
      //   console.log('All data must be filled in')
      // } else {
      const setData = {
        category_id,
        product_name,
        product_image:
          request.file === undefined ? '' : request.file.filename,
        product_price,
        product_stock,
        product_desc,
        size_r,
        size_l,
        size_xl,
        size_250,
        size_300,
        size_500,
        home_delivery,
        dine_in,
        take_away,
        start_hour,
        end_hour,
        product_created_at: new Date(),
        product_status
      }
      const result = await postProductModel(setData)
      return helper.response(response, 200, 'Success Post Product', result)
      // }
    } catch (error) {
      console.log(error)
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  patchProduct: async (request, response) => {
    try {
      const { id } = request.params
      // const getName = await getProductByIdModel(id)
      // const name = getName[0].product_image
      // if (name !== '' && name !== request.file.filename) {
      //   fs.unlink(`./upload/${name}`, function (err) {
      //     if (err) {
      //       console.log('Error while deleting the file' + err)
      //     }
      //   })
      // }
      const {
        category_id,
        product_name,
        product_price,
        product_stock,
        product_desc,
        size_r,
        size_l,
        size_xl,
        size_250,
        size_300,
        size_500,
        home_delivery,
        dine_in,
        take_away,
        start_hour,
        end_hour,
        product_status
      } = request.body
      if (
        category_id == null ||
        product_name == null ||
        product_price == null ||
        product_stock == null ||
        product_desc == null ||
        home_delivery == null ||
        dine_in == null ||
        take_away == null ||
        product_status == null
      ) {
        console.log('All data must be filled in')
      } else {
        const setData = {
          category_id,
          product_name,
          product_image:
          request.file === undefined ? '' : request.file.filename,
          product_price,
          product_stock,
          product_desc,
          size_r,
          size_l,
          size_xl,
          size_250,
          size_300,
          size_500,
          home_delivery,
          dine_in,
          take_away,
          start_hour,
          end_hour,
          product_created_at: new Date(),
          product_status
        }
        // console.log('gambar isinya ' + setData.product_image)
        // const getName = await getProductByIdModel(id)
        // const name = getName[0].product_image
        // console.log(setData.product_image)
        // if (setData.product_image === '') {
        //   delete setData.product_image
        // }
        // if (name !== '' && name !== setData.product_image) {
        //   fs.unlink(`./upload/${name}`, function (err) {
        //     if (err) {
        //       console.log('Error while deleting the file' + err)
        //     }
        //   })
        // }
        const checkId = await getProductByIdModel(id)
        if (checkId.length > 0) {
          const result = await patchProductModel(setData, id)
          return helper.response(response, 200, 'Success Patch Product', result)
        } else {
          return helper.response(
            response,
            404,
            `Product By Id : ${id} Not Found`
          )
        }
      }
    } catch (error) {
      console.log(error)
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  deleteProduct: async (req, res) => {
    try {
      const { id } = req.params
      const getName = await getProductByIdModel(id)
      const name = getName[0].product_image
      fs.unlink(`./upload/${name}`, function (err) {
        if (err) {
          console.log('Error while deleting the file' + err)
        }
      })
      const result = await deleteProductModel(id)
      if (result.length == null) {
        return helper.response(
          res,
          200,
          `Success Delete Product By Id : Product ${id} deleted`
        )
      } else {
        return helper.response(res, 404, `Product By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
