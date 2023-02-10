const db = require("../models")
const Product = db.product
const {sequelize} = require("../models")
const { Op } = require("sequelize")
const fs = require('fs');
const path = require('path');

const productController = {
    create: async (req,res) => {
        // console.log(req.body);
        // get filename
        console.log(req.file);

        // if(req.file.fieldname != "image"){
        //     return new Error(`Format file must an image`)
        // }

        let fileName = req.file.filename
        // rewrite filename and add url
        fileName =  process.env.render_img + fileName
        
        const t = await sequelize.transaction();
        try {
            // combine object req.body and added image name
            const data = {
                ...req.body,
                image : fileName
            }
            console.log(data);
            await Product.create({...data})

            res.status(200).send("Success add new product")

        } catch(err){
            console.log(err);
            return res.status(400).send(err)
        }
    },
    edit: async (req,res) => {
        const id = req.params.id

        const t = await sequelize.transaction();
        try{
        
        let data = {}
        
        if(req.file){
            // delete previous pic in local file before added new image
            const data = await Product.findOne({
                where: {
                    id: id
                }, attributes : ['image']
            }, {transaction: t})
            
            const urlPic = (data.dataValues.image).split("/")[2]

            //create new directory path using library path
            const dirPath = path.join(__dirname, `/../public/products_img/${urlPic}`);

            console.log(dirPath);


          fs.unlink(dirPath, (err)=> {
            throw new Error(err)
          })

          console.log(req.file);

            // console.log(res);

        // get filename
        let fileName = req.file.filename
        // rewrite filename and add url
        fileName =  process.env.render_img + fileName
        
        data = {
            ...req.body,
            image: fileName
            }
        } else {
            data = {
                ...req.body
            }
        }
        console.log(data);
            const result = await Product.update({...data},
            {
                where: {
                    id: id
                }
            }, {transaction: t})
            if(!result) {
                throw new Error('Edit product failed')
            }
            await t.commit();
            res.status(200).send("Edit product success")
        } catch (err) {
            await t.rollback();
            return res.status(400).send(err.message)
        }
    },
    fetchProduct: async (req,res) => {
        const page = parseInt(req.query.page) || 1
        const limit = 24
        const search = req.query.search || ""
        const offset = limit * (page - 1)
        const sortBy = req.query.sortBy || "name"
        const order = req.query.order || "ASC"

        const t = await sequelize.transaction();

        try{
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
        },{transaction : t})
        if(totalRows == 0) {
            throw new Error('Fetching data failed')
        }

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
                [sortBy, order]
            ]
        }, {transaction: t})

        if(!result){
            throw new Error('Fetching all product failed')
        }

        res.status(200).json({
            result : result,
            page: page,
            limit: limit,
            totalRows: totalRows,
            totalPage: totalPage
        })
        await t.commit();

    } catch (err) {
        await t.collback();
        return res.status(400).send(err.message)
    }
    },
    fetchProductByCatId: async (req,res) => {
    const catId = req.params.id
    console.log(catId);
    const page = parseInt(req.query.page) || 1
    const limit = 18
    const search = req.query.search || ""
    const offset = limit * (page - 1)

    const t = await sequelize.transaction();
    try {
    const totalRows = await Product.count({
        where : {
            [Op.and] : [
                {
                    CategoryId : catId
                },
                {
                    [Op.or] : [
                        {
                            name : {[Op.like]: `%${search}%`}
                        },
                        {
                            price : {[Op.like]: `%${search}%`}
                        }
                    ]
                }
            ]
        }
    }, {transaction : t})
    if(totalRows == 0) {
        throw new Error('Fetching data failed')
    }
    const totalPage = Math.ceil(totalRows / limit)
    const result = await Product.findAll({
        where : {
            [Op.and] : [
                {
                    CategoryId : catId
                },
                {
                    [Op.or] : [
                        {
                            name : {[Op.like]: `%${search}%`}
                        },
                        {
                            price : {[Op.like]: `%${search}%`}
                        }
                    ]
                }
            ]
        },
        offset: offset,
        limit: limit,
        order: [
            ['name']
        ]
    }, {transaction : t})
    if(!result){
        throw new Error('Fetching all product by category failed')
    }

    res.status(200).json({
        result : result,
        page: page,
        limit: limit,
        totalRows: totalRows,
        totalPage: totalPage
    })
    await t.commit();

    } catch (err) {
        await t.rollback();
        return res.status(400).send(err.message)
    }

    },
    delete: async (req,res) =>{
        const id = req.params.id
        
        try {
            const result = await Product.destroy({where: {id: id}})
            if(!result){
                throw new Error('Delete product failed')
            }

            res.status(200).send('Delete product success')
        } catch (err) {
            console.log(err);
            return res.status(400).send(err.message)
        }
    }
}

module.exports = productController