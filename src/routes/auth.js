const express = require("express")
const router = express.Router()
const {authController} = require("../controllers")
const {validate, userValidateRules} = require("../middlewares/validator")
const { tokenVerify, checkRole } = require("../middlewares/verifyToken")


router.get("/userList", tokenVerify, authController.fetchAll)
router.post("/register",tokenVerify, checkRole, userValidateRules(), validate, authController.register)
router.post("/login", authController.login)
router.get("/token", authController.refreshToken)

module.exports = router