const express = require("express")
const router = express.Router()
const {authController} = require("../controllers")
const {validateUser, userValidationRules} = require("../middlewares/authValidator")
const { tokenVerify, checkRole } = require("../middlewares/verifyToken")



router.post("/register",tokenVerify, checkRole, userValidationRules(), validateUser, authController.register)
router.post("/login", authController.login)

module.exports = router