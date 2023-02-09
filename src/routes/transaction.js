const express = require("express")
const router = express.Router()
const {transactionController} = require("../controllers")
const { checkRole, tokenVerify } = require("../middlewares/verifyToken")

router.post("/create", transactionController.create )

module.exports = router
