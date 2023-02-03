const db = require("../models")
const User = db.user
const bcrypt = require("bcrypt")
const { Op } = require("sequelize")
const {sequelize} = require("../models")


const authController = {
    register: async (req,res) => {
        const {password} = req.body

        try{
            const hashPass = bcrypt.hashSync(password, 10)

            const data = {
                ...req.body,
                password : hashPass
            }
            delete data.passwordConfirm

            console.log(data);

            // const result = await User.create({...data})
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
        const checkUser = await User.findOne({
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
        
        if(!checkUser){
            throw new Error('Login failed. Email/username/phone number is not registered')
        }

        const result = bcrypt.compareSync(password, checkUser.password)

        if(!result){
            throw new Error('Password is wrong')
        }
            
        res.status(200).send(result)

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