const express = require("express")
const router = express.Router()
const {authController} = require("../controllers")
const {validate, userValidateRules} = require("../middlewares/validator")
const { tokenVerify, checkRole } = require("../middlewares/verifyToken")


router.get("/userList", tokenVerify, checkRole, authController.fetchAllEmployee)
router.post("/register",tokenVerify, checkRole, userValidateRules(), validate, authController.register)
router.patch("/edit/:id",tokenVerify, checkRole, authController.editEmployee)
router.post("/login", authController.login)
router.get("/token", authController.refreshToken)
router.delete("/delete/:id", tokenVerify, checkRole, authController.deleteEmployee)
router.post("/logout", authController.logout)

module.exports = router