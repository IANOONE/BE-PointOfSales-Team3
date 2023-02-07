const express = require("express")
const router = express.Router()
const {categoryController} = require("../controllers")
const {categoryValidateRules, validate} = require("../middlewares/validator")

router.post("/create", categoryValidateRules(), validate, categoryController.create)
router.patch("/edit/:id", categoryController.edit)
router.delete("/delete/:id", categoryController.delete)
router.get("/list", categoryController.fetchAll)

module.exports = router