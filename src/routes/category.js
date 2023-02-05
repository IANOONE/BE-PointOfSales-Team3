const express = require("express")
const router = express.Router()
const {categoryController} = require("../controllers")

router.post("/create", categoryController.create)
router.patch("/edit/:id", categoryController.edit )

module.exports = router