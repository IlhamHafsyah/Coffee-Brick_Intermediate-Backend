const helper = require("../helper/response");
const jwt = require("jsonwebtoken");

module.exports = {
  authorization: (req, res, next) => {
    let token = req.headers.authorization;
    // console.log(token);

    if (token) {
      token = token.split(" ")[1];
      jwt.verify(token, "RAHASIA", (error, result) => {
        if (
          (error && error.name === "JsonWebTokenError") ||
          (error && error.name === "TokenExpiredError")
        ) {
          console.log(error);
          return helper.response(res, 400, error.message);
        } else {
          //proses pengecekan role
          // console.log(result);
          // console.log(result.users_role);
          req.decodetoken = result;
          next();
        }
      });
    } else {
      return helper.response(res, 400, "Please Login First !");
    }
  },
  authentication: (req, res, next) => {
    // console.log(
    //   "ini decode token =" + JSON.stringify(req.decodetoken.users_role)
    // );
    // console.log("decode");
    // console.log(req.decodetoken.users_role);
    if (req.decodetoken.users_role === 0) {
      return helper.response(
        res,
        400,
        "Not Allowed ! Page accessible by admin only"
      );
    } else {
      next();
    }
  },
};
