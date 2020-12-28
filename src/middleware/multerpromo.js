const multer = require("multer");
const helper = require("../helper/response");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./upload/promocode/");
  },
  filename: function (req, file, cb) {
    cb(null, new Date().toISOString().replace(/:/g, "-") + file.originalname);
  },
});

const fileFilter = (req, file, cb) => {
  if (
    file.mimetype === "image/jpg" ||
    file.mimetype === "image/png" ||
    file.mimetype === "image/jpeg"
  ) {
    cb(null, true);
  } else {
    cb(new Error("File format must be png or jpg"), false);
  }
};

// kondisi kedua limit
const maxSize = 1 * 1024 * 1024;
//storege: storage === storage,
const upload = multer({
  storage,
  limits: { fileSize: maxSize },
  fileFilter,
}).single("promocode_image");

const uploadFilter = (req, res, next) => {
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      //A multer error occured when uploading
      return helper.response(res, 400, err.message);
    } else if (err) {
      return helper.response(res, 400, err.message);
    }
    next();
  });
};

module.exports = uploadFilter;
