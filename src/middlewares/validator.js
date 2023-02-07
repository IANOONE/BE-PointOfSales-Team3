const { body, validationResult } = require("express-validator")
const db = require("../models")
const Product = db.product
const Category = db.category
const User = db.user

const userValidateRules =  () => {
    return [
        body('phone_number').isNumeric().withMessage("Phone number should be a numbers").custom(async (val)=> {
            return await User.findOne({
                where: {
                    phone_number : val
                }
            }).then(user => {
                if(user){
                    return Promise.reject('Phone number already registered')
                }
            })
        }),
        body('email').isEmail().withMessage("This is not an email").custom(async (val)=> {
            return await User.findOne({
                where: {
                    email : val
                }
            }).then(user => {
                if(user){
                    return Promise.reject('Email already registered')
                }
            })
        }),
        body('password').isLength({min: 8, max: 16}).withMessage("Password length must be between 8 - 16 characters").custom((value, {req}) => value === req.body.passwordConfirm).withMessage("Password and Password confirmation not match")  
    ]
}
const productValidateRules = () => {
    return [
        body('name').custom(async (val)=> {
            return await Product.findOne({
                where: {
                    name : val
                }
            }).then(product => {
                if(product){
                    return Promise.reject(`Product has been added`)
                }
            })
        })
    ]
}

const categoryValidateRules = () => {
    return [
        body('name').custom(async (val)=> {
            return await Category.findOne({
                where: {
                    name : val
                }
            }).then(category => {
                if(category){
                    return Promise.reject(`Category has been added`)
                }
            })
        })
    ]
}

const validate = (req,res,next) => {
    const errors = validationResult(req)

    if(!errors.isEmpty()){

        return res.status(400).json({ 
            errors: errors.array()[0].msg
        });
    }

    return next()
}

module.exports = {userValidateRules, productValidateRules, categoryValidateRules, validate}