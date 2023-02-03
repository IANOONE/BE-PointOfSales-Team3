const express = require("express")
const router = express.Router()
const {authController} = require("../controllers")
const {validate, validationRules} = require("../middlewares/validator")


router.post("/register", validationRules(), validate, authController.register)
router.post("/login", authController.login)

module.exports = router