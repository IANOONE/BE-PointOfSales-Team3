const db = require("../models")
const Category = db.category
const Product = db.product
const {sequelize} = require("../models")
const { Op, where } = require("sequelize")
const fs = require("fs")

const categoryController = {
    create: async (req,res) => {
        try{
           const result = await Category.create({...req.body})
            if(!result){
                throw new Error('Add new category failed')
            }
            res.status(200).send("Success added new category")
        } catch (err){
            return res.status(400).send(err.message)
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
            return res.status(400).send(err.message)
        }
    },
    delete: async (req,res) => {
        const id = req.params.id
        console.log(id);
        const t = await sequelize.transaction();
        try{
            await Product.destroy({where: {CategoryId:id}}, {transaction: t})

            const result = await Category.destroy({where :{id: id}}, {transaction: t})
            if(Object.keys(result).length == 0){
                throw new Error('Delete category failed')
                // throw 'Delete category failed'

            }
            await t.commit();

            res.status(200).send("Success delete category")
        } catch (err) {

            await t.rollback();
            return res.status(400).send(err.message)
        } 
    }

}

module.exports = categoryController