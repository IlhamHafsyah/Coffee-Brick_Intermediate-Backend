const {
  getHistoryModel,
  getDetailhistoryModel,
  postHistoryModel,
  postDetailhistoryModel,
  deleteHistoryModel,
  patchHistoryModel
} = require('../model/m_history')
const redis = require('redis')
const client = redis.createClient()
const helper = require('../helper/response')

module.exports = {
  getHistory: async (req, res) => {
    try {
      const { id } = req.params
      const result = await getHistoryModel(id)
      if (result.length > 0) {
        client.setex(`gethistorybyid:${id}`, 3600, JSON.stringify(result))
        return helper.response(res, 200, 'Success Get History By Id', result)
      } else {
        return helper.response(res, 404, `History By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getDetailhistory: async (req, res) => {
    try {
      const { id } = req.params
      const result = await getDetailhistoryModel(id)
      if (result.length > 0) {
        client.setex(`getdetailhistorybyid:${id}`, 3600, JSON.stringify(result))
        return helper.response(
          res,
          200,
          'Success Get detailhistory By Id',
          result
        )
      } else {
        return helper.response(
          res,
          404,
          `detailhistory By Id : ${id} Not Found`
        )
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  postHistory: async (req, res) => {
    try {
      const {
        history_id,
        invoice,
        payment_method,
        subtotal,
        user_id,
        status
      } = req.body
      if (
        invoice == null ||
        payment_method == null ||
        subtotal == null ||
        user_id == null ||
        status == null
      ) {
        console.log('All data must be filled in')
      } else {
        const setData = {
          history_id,
          invoice,
          payment_method,
          subtotal,
          user_id,
          history_created_at: new Date(),
          status
        }
        const result = await postHistoryModel(setData)
        return helper.response(res, 200, 'Success Post History', result)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  postDetailhistory: async (req, res) => {
    try {
      const [{ product_id, qty, size, subtotal, history_id }] = req.body
      const setData = {
        product_id,
        qty,
        size,
        subtotal,
        history_id
      }
      const result = await postDetailhistoryModel(setData)
      return helper.response(res, 200, 'Success Post Detail History', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  patchHistory: async (req, res) => {
    try {
      const { id } = req.params
      const { status } = req.body
      if (status == null) {
        console.log('All data must be filled in')
      } else {
        const setData = {
          status
        }
        const checkId = await getHistoryModel(id)
        if (checkId.length > 0) {
          // proses update data
          const result = await patchHistoryModel(setData, id)
          return helper.response(res, 200, 'Success Patch Product', result)
        } else {
          return helper.response(res, 404, `Product By Id : ${id} Not Found`)
        }
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  deleteHistory: async (req, res) => {
    try {
      const { id } = req.params
      const result = await deleteHistoryModel(id)
      if (result.length == null) {
        return helper.response(
          res,
          200,
          `Success Delete History By Id : History ${id} deleted`
        )
      } else {
        return helper.response(res, 404, `History By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
