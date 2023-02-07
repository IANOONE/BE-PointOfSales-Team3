const db = require("../models")
const Category = db.category
const Product = db.product
const {sequelize} = require("../models")
const { Op, where } = require("sequelize")

const categoryController = {
    create: async (req,res) => {
        try{
           const result = await Category.create({...req.body})
            if(!result){
                throw new Error('Add new category failed')
            }
            res.status(200).send("Success added new category")
        } catch (err){
            return res.status(400).send(err)
        }
    },
    edit: async (req,res) => {
        const id = req.params.id
        console.log(id);
        try{
            const result = await Category.update({...req.body}, {where :{id: id}})
            if(!result){
                throw new Error('Edit category failed')
            }
            res.status(200).send("Success edit category")
        } catch (err) {
            console.log(err);
            return res.status(400).send(err)
        }
    },
    delete: async (req,res) => {
        const id = req.params.id
        console.log(id);
        try{
            const result = await Category.destroy({where :{id: id}})
            if(!result){
                throw new Error('Delete category failed')
            }
            await Product.destroy({where: {CategoryId: id}})
            res.status(200).send("Success delete category")
        } catch (err) {
            console.log(err);
            return res.status(400).send(err)
        } 
    }

}

module.exports = categoryController