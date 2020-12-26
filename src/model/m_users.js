const connection = require("../config/mysql");

module.exports = {
  registerUsersModel: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query("INSERT INTO users1 SET ?", setData, (error, result) => {
        if (!error) {
          const newResult = {
            users_id: result.insertId,
            ...setData,
          };
          delete newResult.users_password;
          resolve(newResult);
        } else {
          reject(new Error(error));
        }
      });
    });
  },
  loginUsersEmailModel: (email) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT users_id, users_name, users_email, users_password, users_role, status FROM users1 WHERE users_email = ?",
        email,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error));
        }
      );
    });
  },
  getUsersModel: () => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM users1", (error, result) => {
        !error ? resolve(result) : reject(new Error(error));
        newFunction(result, error);
      });
    });
  },
  getUsersByIdModel: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM users1 WHERE users_id = ${id}`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error));
        }
      );
    });
  },
  patchUsersModel: (setData, id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE users1 SET ? WHERE users_id = ?",
        [setData, id],
        (error, result) => {
          if (!error) {
            const newResult = {
              users_id: id,
              ...setData,
            };
            resolve(newResult);
          } else {
            reject(new Error(error));
          }
        }
      );
    });
  },
  deleteUsersModel: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "DELETE FROM users1 WHERE users_id = ?",
        id,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error));
        }
      );
    });
  },
};
function newFunction(result, error) {
  console.log(result);
  console.log(error);
}
