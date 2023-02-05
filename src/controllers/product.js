const db = require("../models")
const Product = db.product
const {sequelize} = require("../models")
const { Op } = require("sequelize")

const productController = {
    create: async (req,res) => {
        console.log(req.body);
        // get filename
        let fileName = req.file.filename
        const url = "localhost:2000/image/"
        // rewrite filename and add url
        fileName =  url + fileName
        
        const t = await sequelize.transaction();
        try {
            // combine object req.body and added image name
            const data = {
                ...req.body,
                image : fileName
            }
            console.log(data);
            await Product.create({...data}, { transaction: t })

            await t.commit();
            res.status(200).send("Success add new product")

        } catch(err){
            console.log(err);
            await t.rollback();
            return res.status(400).send(err)
        }
    },
    fetchProduct: async (req,res) => {
        const page = parseInt(req.query.page) || 1
        const limit = 5
        const search = req.query.search || ""
        const offset = limit * page
        const totalRows = await Product.count({
            where : {
                [Op.or] : [
                    {
                        name : {[Op.like]: `%${search}%`}
                    },
                    {
                        price : {[Op.like]: `%${search}%`}
                    }
                ]
            }
        })
        const totalPage = Math.ceil(totalRows / limit)
        const result = await Product.findAll({
            where : {
                [Op.or] : [
                    {
                        name : {[Op.like]: `%${search}%`}
                    },
                    {
                        price : {[Op.like]: `%${search}%`}
                    }
                ]
            },
            offset: offset,
            limit: limit,
            order: [
                ['name']
            ]
        })

        res.status(200).json({
            result : result,
            page: page,
            limit: limit,
            totalRows: totalRows,
            totalPage: totalPage
        })
    },
    edit: async (req,res) => {
        const id = req.params.id
        let data = {}
        if(req.file){
        // get filename
        let fileName = req.file.filename
        const url = "localhost:2000/image/"
        // rewrite filename and add url
        fileName =  url + fileName
        
        data = {
            ...req.body,
            image: fileName
            }
        }else {
            data = {
                ...req.body
            }
        }

        try{
            await Product.update({
                ...data
            },
            {
                where: {
                    id: id
                }
            })
            res.status(200).send("Success edit product")
        } catch (err) {
            console.log(err);
            return res.status(400).send(err)
        }
    }
}

module.exports = productController