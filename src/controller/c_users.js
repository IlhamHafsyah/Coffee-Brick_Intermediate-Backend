const bcrypt = require('bcrypt')
const redis = require('redis')
const client = redis.createClient()
const helper = require('../helper/response')
const jwt = require('jsonwebtoken')
const {
  registerUsersModel,
  loginUsersEmailModel,
  getUsersModel,
  getUsersByIdModel,
  patchUsersModel,
  deleteUsersModel,
  patchPassModel
} = require('../model/m_users')
const fs = require('fs')

module.exports = {
  registerUsers: async (req, res) => {
    try {
      const {
        users_name,
        users_email,
        users_password,
        users_phone,
        display_name,
        first_name,
        last_name,
        date_of_birth,
        users_gender,
        users_role,
        status
      } = req.body
      const salt = bcrypt.genSaltSync(10)
      const encryptPassword = bcrypt.hashSync(users_password, salt)
      const setData = {
        users_name,
        users_email,
        profile_picture: req.file === undefined ? '' : req.file.filename,
        users_role,
        users_phone,
        display_name,
        first_name,
        last_name,
        date_of_birth,
        users_gender,
        status,
        users_password: encryptPassword,
        users_created_at: new Date()
      }
      const result = await registerUsersModel(setData)
      return helper.response(res, 200, 'Success register Users', result)
    } catch (error) {
      console.log(error)
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  loginUsers: async (req, res) => {
    try {
      const { users_email, users_password } = req.body
      const checkDataUser = await loginUsersEmailModel(users_email)
      if (checkDataUser.length > 0) {
        const checkPassword = bcrypt.compareSync(
          users_password,
          checkDataUser[0].users_password
        )
        if (checkPassword) {
          const {
            users_id,
            users_name,
            users_email,
            users_role,
            status
          } = checkDataUser[0]
          const payload = {
            users_id,
            users_name,
            users_email,
            users_role,
            status
          }
          const token = jwt.sign(payload, 'RAHASIA', { expiresIn: '3h' })
          const result = { ...payload, token }
          return helper.response(res, 200, 'You are Loging in !', result)
        } else {
          return helper.response(res, 400, 'Password Incorrect !')
        }
      } else {
        return helper.response(res, 400, 'Email not registered !')
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getUsers: async (req, res) => {
    try {
      const result = await getUsersModel()
      client.setex('getusers', 3600, JSON.stringify(result))
      return helper.response(res, 200, 'Success Get Users Data', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getUsersById: async (req, res) => {
    try {
      const { id } = req.params
      const result = await getUsersByIdModel(id)
      if (result.length > 0) {
        client.setex(`getusersbyid:${id}`, 3600, JSON.stringify(result))
        return helper.response(res, 200, 'Success Get Users By Id', result)
      } else {
        return helper.response(res, 404, `Users By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  patchUsers: async (req, res) => {
    try {
      const { id } = req.params
      // const getName = await getUsersByIdModel(id)
      // const name = getName[0].profile_picture
      // fs.unlink(`./upload/${name}`, function (err) {
      //   if (err) {
      //     console.log('Error while deleting the file' + err)
      //   }
      // })
      const {
        users_name,
        users_email,
        // users_password,
        users_phone,
        delivery_address,
        display_name,
        first_name,
        last_name,
        date_of_birth,
        users_gender,
        users_role,
        status
      } = req.body
      // const salt = bcrypt.genSaltSync(10)
      // const encryptPassword = bcrypt.hashSync(users_password, salt)
      // if (
      //   users_name == null ||
      //   users_email == null ||
      //   users_password == null ||
      //   users_phone == null ||
      //   delivery_address == null ||
      //   display_name == null ||
      //   first_name == null ||
      //   last_name == null ||
      //   date_of_birth == null ||
      //   users_gender == null ||
      //   users_role == null ||
      //   status == null
      // ) {
      //   console.log('All data must be filled in')
      // } else {
      const setData = {
        users_name,
        users_email,
        // users_password: encryptPassword,
        profile_picture: req.file === undefined ? '' : req.file.filename,
        users_phone,
        delivery_address,
        display_name,
        first_name,
        last_name,
        date_of_birth,
        users_gender,
        users_role,
        status,
        users_updated_at: new Date()
      }
      const checkId = await getUsersByIdModel(id)
      if (checkId.length > 0) {
        const result = await patchUsersModel(setData, id)
        return helper.response(res, 200, 'Success Patch User Data', result)
      } else {
        return helper.response(res, 404, `Users By Id : ${id} Not Found`)
      }
      // }
    } catch (error) {
      console.log(error)
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  patchPassword: async (req, res) => {
    try {
      const { id } = req.params
      const { users_password } = req.body
      const salt = bcrypt.genSaltSync(10)
      const encryptPassword = bcrypt.hashSync(users_password, salt)
      const setPass = {
        users_password: encryptPassword
      }
      const checkId = await getUsersByIdModel(id)
      if (checkId.length > 0) {
        const result = await patchPassModel(setPass, id)
        return helper.response(res, 200, 'Success Patch User Data', result)
      } else {
        return helper.response(res, 404, `Password By Id : ${id} Not Found`)
      }
    } catch (error) {
      console.log(error)
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  deleteUsers: async (req, res) => {
    try {
      const { id } = req.params
      const getName = await getUsersByIdModel(id)
      const name = getName[0].profile_picture
      fs.unlink(`./upload/${name}`, function (err) {
        if (err) {
          console.log('Error while deleting the file' + err)
        }
      })
      const result = await deleteUsersModel(id)
      if (result.length == null) {
        return helper.response(
          res,
          200,
          `Success Delete User By Id : User ${id} deleted`
        )
      } else {
        return helper.response(res, 404, `User By Id : ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
