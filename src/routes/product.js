const express = require("express")
const router = express.Router()
const {productController} = require("../controllers")
const { checkRole } = require("../middlewares/verifyToken")
// const {validateUser, userValidationRules} = require("../middlewares/authValidator")
const fileUploader = require("../middlewares/multer")
const uploadSingle = fileUploader({destinationFolder : "products_img"}).single('image')


router.post("/create", uploadSingle , productController.create)

module.exports = router