const db = require("../models")
const User = db.user
const bcrypt = require("bcrypt")
const { Op } = require("sequelize")
const {sequelize} = require("../models")
const jwt = require("jsonwebtoken")


const authController = {
    register: async (req,res) => {
        const {password} = req.body
        try{
            const hashPass = bcrypt.hashSync(password, 10)

            // added hash password to the object data, and replace password value from req.body
            const data = {
                ...req.body,
                password : hashPass
            }
            // clean data before input into db
            // delete password confirm
            delete data.passwordConfirm

            console.log(data);
            const result = await User.create({...data})
            res.status(200).send(result)
        }catch(error){
            res.status(400).send(error)
        }
    },
    login: async (req,res) => {
        console.log(req.body);
        const {userLog, password} = req.body

        const t = await sequelize.transaction();
        try {
            // get data user by user
        const result = await User.findOne({
            where : {
                [Op.or] : [
                    {
                        email : userLog
                    },
                    {
                        phone_number : userLog
                    },
                    {
                        username : userLog
                    }
                ]
            }
        }, {transaction : t})
        
        if(!result){
            throw new Error('Login failed. Email/username/phone number is not registered')
        }
        //verify password and comparing with decrypted password
        const verifyPass = bcrypt.compareSync(password, result.password)

        if(!verifyPass){
            throw new Error('Password is wrong')
        }

        const token = jwt.sign({...result}, process.env.secret_key, {expiresIn: "8h"})
        
        res.status(200).send(token)

        await t.commit();

        } catch(error) {
        console.log(error);
        res.status(400).send(error.toString())
        if(t){
        await t.rollback();
        }
        }
    }
}

module.exports = authController