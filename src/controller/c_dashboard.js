const {
  todayIncomeModel,
  perWeekModel,
  yearIncomeModel,
} = require("../model/m_dashboard");
const helper = require("../helper/response");

module.exports = {
  todayIncome: async (req, res) => {
    try {
      const { date } = req.body;
      const result = await todayIncomeModel(date);
      if (result.length > 0) {
        return helper.response(res, 200, "Success Sum Today Income", result);
      } else {
        return helper.response(res, 404, `Today Income for today is null`);
      }
    } catch (error) {
      return helper.response(res, 400, "Bad Request", error);
    }
  },
  perWeek: async (req, res) => {
    try {
      const result = await perWeekModel();
      if (result.length > 0) {
        return helper.response(
          res,
          200,
          "Success Count Orders This Week",
          result
        );
      } else {
        return helper.response(res, 404, `Order for This Week is null`);
      }
    } catch (error) {
      return helper.response(res, 400, "Bad Request", error);
    }
  },
  yearIncome: async (req, res) => {
    try {
      const result = await yearIncomeModel();
      if (result.length > 0) {
        return helper.response(res, 200, "Success Sum Year Income", result);
      } else {
        return helper.response(res, 404, `Income for this year is null`);
      }
    } catch (error) {
      console.log(error);
      return helper.response(res, 400, "Bad Request", error);
    }
  },
};
