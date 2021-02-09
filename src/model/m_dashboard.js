const connection = require('../config/mysql')

module.exports = {
  todayIncomeModel: () => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT SUM(subtotal) AS today_income FROM history WHERE history_created_at LIKE '%2021-01-12%'`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  perWeekModel: () => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT COUNT(*) AS total_order, YEARWEEK(history_created_at) AS this_week FROM history GROUP BY YEARWEEK(history_created_at)',
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  yearIncomeModel: () => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT SUM(subtotal) AS this_year_income FROM history WHERE YEAR(history_created_at) = YEAR(NOW())',
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  perMonthModel: () => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT MONTHNAME(history_created_at) AS month, SUM(subtotal) AS per_month_income FROM history WHERE YEAR(history_created_at) = YEAR(NOW()) GROUP BY MONTH(history_created_at)',
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
