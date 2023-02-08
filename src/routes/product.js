const express = require("express")
const router = express.Router()
const {productController} = require("../controllers")
const { checkRole } = require("../middlewares/verifyToken")
const {productValidateRules, validate} = require("../middlewares/validator")
// const {validateUser, userValidationRules} = require("../middlewares/authValidator")
const fileUploader = require("../middlewares/multer")
const uploadSingle = fileUploader({destinationFolder : "products_img"}).single('image')
const { tokenVerify } = require("../middlewares/verifyToken")


router.post("/create", tokenVerify, checkRole, productValidateRules(), validate, uploadSingle , productController.create)
router.patch("/edit/:id", tokenVerify, checkRole, uploadSingle , productController.edit)
router.get("/list", tokenVerify, checkRole, productController.fetchProduct)
router.get("/byCategory/:id", tokenVerify, productController.fetchProductByCatId)
router.delete("/delete/:id", tokenVerify, checkRole, productController.delete)

module.exports = router 