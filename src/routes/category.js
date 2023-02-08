const express = require("express")
const router = express.Router()
const {categoryController} = require("../controllers")
const {categoryValidateRules, validate} = require("../middlewares/validator")
const { tokenVerify, checkRole } = require("../middlewares/verifyToken")

router.post("/create", tokenVerify, checkRole, categoryValidateRules(), validate, categoryController.create)
router.patch("/edit/:id", tokenVerify, checkRole, categoryController.edit)
router.delete("/delete/:id", tokenVerify, checkRole, categoryController.delete)
router.get("/list", tokenVerify, checkRole, categoryController.fetchAll)

module.exports = router