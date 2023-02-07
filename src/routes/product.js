const express = require("express")
const router = express.Router()
const {productController} = require("../controllers")
const { checkRole } = require("../middlewares/verifyToken")
const {productValidateRules, validate} = require("../middlewares/validator")
// const {validateUser, userValidationRules} = require("../middlewares/authValidator")
const fileUploader = require("../middlewares/multer")
const uploadSingle = fileUploader({destinationFolder : "products_img"}).single('image')
const { tokenVerify } = require("../middlewares/verifyToken")


router.post("/create", productValidateRules(), validate, uploadSingle , productController.create)
router.patch("/edit/:id", uploadSingle , productController.edit)
router.get("/list", productController.fetchProduct)
router.get("/byCategory/:id", productController.fetchProductByCatId)
router.delete("/delete/:id", productController.delete)

module.exports = router