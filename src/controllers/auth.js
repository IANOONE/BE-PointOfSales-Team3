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

        try {
            // get data user by user
        const user = await User.findOne({
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
        })
        
        
        if(!user){
            throw new Error('Login failed. Email/username/phone number is not registered')
        }
        //verify password and comparing with decrypted password
        const verifyPass = bcrypt.compareSync(password, user.password)

        
        if(!verifyPass){
            throw new Error('Password is wrong')
        }

        const result = {
            ...user.dataValues
        }

        delete result.password
        delete result.refresh_token
        console.log(result);

        const accessToken = jwt.sign({...result}, process.env.secret_key, {expiresIn: "15s"})

        const refreshToken = jwt.sign({...result}, process.env.secret_key, {expiresIn: "1h"})
        
        await User.update({
            refresh_token : refreshToken
        },
        {where : {id : user.id}}
        )

        res.cookie(
            'refreshToken', refreshToken,{
            httpOnly: true,
            maxAge: 1 * 60 * 60 * 1000
        })
        res.status(200).json({
            accessToken : accessToken,
            // data: result
        })

        } catch(error) {
        console.log(error);
        res.status(400).send(error.toString())
        }
    },
    refreshToken: async (req,res) => {
        const refToken = req.cookies.refreshToken
        try{

            if(!refToken){
              return new Error('Refresh Token not found')   
            }
            
            const user = await User.findOne({
                where : {
                    refresh_token : refToken
                }
            })

            const data = {
                ...user.dataValues
            }
            delete data.password
            delete data.refresh_token
            
            const accessToken = jwt.sign({...data}, process.env.secret_key, {expiresIn: '15s'})

            res.json({
                accessToken: accessToken
            })

        } catch(err){
            return res.status(400).send(err)
        }
    },
    fetchAll: async (req,res) => {
        try {
            const result = await User.findAll()

            res.status(200).json({
                data: result
            })
        } catch (err) {
            return res.status(400).send(err)
        }
    },
    logout: async (req,res) => {
        const refToken = req.cookies.refreshToken
        try {
            const user = await User.update({
                refresh_token : null
            }, {
                where: {
                    refresh_token: refToken
                }
            })

            if(!user) {
                return new Error('logout failed')
            }

            res.clearCookie('refreshToken')
            res.status(200).send("success logout")
        } catch(err){
            return res.status(400).send(err)
        }
    }
    
}

module.exports = authController