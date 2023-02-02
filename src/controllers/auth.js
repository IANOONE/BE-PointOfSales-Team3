const db = require("../models")
const User = db.user
const bcrypt = require("bcrypt")


const authController = {
    register: async (req,res) => {
        console.log(req.body);
        const {password} = req.body

        try{
            const hashPass = bcrypt.hashSync(password, 10)

            const data = {
                ...req.body,
                password : hashPass
            }
            delete data.passwordConfirm

            console.log(data);

            const result = await User.create({...data})
            res.status(200).send(result)
        }catch(error){
            res.status(400).send(error)
        }
    }
}

module.exports = authController