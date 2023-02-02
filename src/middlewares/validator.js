const { body, validationResult } = require("express-validator")

const validationRules = () => {
    return [
        body('phone_number').isNumeric().withMessage("Phone number should be a number").isLength({min: 10}).withMessage("Phone number length should be more than 10 characters"),
        body('email').isEmail().withMessage("This is not an email"),
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