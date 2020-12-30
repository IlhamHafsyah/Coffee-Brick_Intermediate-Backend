const connection = require('../config/mysql')

module.exports = {
  getCheckoutModel: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        // `SELECT * FROM history JOIN detailhistory ON history.history_id = detailhistory.history_id JOIN product ON detailhistory.product_id = product.product_id`,
        `SELECT SUM(subtotal) AS total FROM detailhistory WHERE history_id = ${id}`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
