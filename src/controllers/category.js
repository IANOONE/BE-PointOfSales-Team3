const db = require("../models")
const Category = db.category
const {sequelize} = require("../models")
const { Op, where } = require("sequelize")

const categoryController = {
    create: async (req,res) => {
        try{
            await Category.create({...req.body})

            res.status(200).send("Success added new category")
        } catch (err){
            return res.status(200).send(err)
        }
    },
    edit: async (req,res) => {
        const id = req.params.id
        console.log(id);
        try{
            await Category.update({...req.body}, {where :{id: id}})
            res.status(200).send("Success edit category")
        } catch (err) {
            console.log(err);
            return res.status(200).send(err)
        }
    }

}

module.exports = categoryController