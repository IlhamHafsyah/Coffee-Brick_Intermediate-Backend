const fs = require("fs");

fs.unlink("product_image", function (err) {
  if (err) {
    console.log("Error while deleting the file" + err);
  }
});
