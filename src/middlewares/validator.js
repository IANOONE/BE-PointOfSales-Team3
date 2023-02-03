const { body, validationResult } = require("express-validator")
const db = require("../models")
const User = db.user
const validationRules =  () => {
    return [
        body('username').custom(async (val)=> {
            return await User.findOne({
                where: {
                    username : val
                }
            }).then(user => {
                if(user){
                    return Promise.reject('Username already registered')
                }
            })
        }),
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

const validate = (req,res,next) => {
    const errors = validationResult(req)

    if(!errors.isEmpty()){

        return res.status(400).json({ 
            errors: errors.array() 
        });
    }

    return next()
}


module.exports = {validate, validationRules}