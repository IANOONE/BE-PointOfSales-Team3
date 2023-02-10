const express = require("express")
const router = express.Router()
const {transactionController} = require("../controllers")
const { checkRole, tokenVerify } = require("../middlewares/verifyToken")

router.post("/create", transactionController.create )
router.get("/list", transactionController.fetchAll )
router.get("/detail/:id", transactionController.fetchDetail )

module.exports = router
