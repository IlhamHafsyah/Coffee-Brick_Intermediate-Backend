const { getCheckoutModel } = require("../model/m_checkout");
const helper = require("../helper/response");

module.exports = {
  getCheckout: async (req, res) => {
    try {
      const { id } = req.params;
      const result = await getCheckoutModel(id);
      if (result.length > 0) {
        return helper.response(res, 200, "Success Get Checkout By Id", result);
      } else {
        return helper.response(res, 404, `Checkout Not Found`);
      }
    } catch (error) {
      console.log(error);
      return helper.response(res, 400, "Bad Request", error);
    }
  },
};
