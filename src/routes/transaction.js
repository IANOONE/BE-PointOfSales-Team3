const express = require("express")
const router = express.Router()
const {transactionController} = require("../controllers")
const { checkRole, tokenVerify } = require("../middlewares/verifyToken")

router.post("/create",tokenVerify, transactionController.create )
router.get("/list", tokenVerify, checkRole, transactionController.fetchAll )
router.get("/detail/:id", tokenVerify, checkRole, transactionController.fetchDetail )

module.exports = router
