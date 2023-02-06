const { body, validationResult } = require("express-validator")
const db = require("../models")
const Product = db.product
const Category = db.category

const productValidateRules = () => {
    return [
        body('name').custom(async (val)=> {
            return await Product.findOne({
                where: {
                    name : val
                }
            }).then(product => {
                if(product){
                    return Promise.reject(``)
                }
            })
        })
    ]
}