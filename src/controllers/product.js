const db = require("../models")
const Product = db.product
const {sequelize} = require("../models")
const { Op } = require("sequelize")

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
            // console.log(data);
            // await Product.create({...data}, { transaction: t })

            await t.commit();
            res.status(200).send("Success add new product")

        } catch(err){
            console.log(err);
            await t.rollback();
            return res.status(400).send(err)
        }
    },
    edit: async (req,res) => {
        const id = req.params.id
        let data = {}

        
        if(req.file){
        // get filename
        let fileName = req.file.filename
        // rewrite filename and add url
        fileName =  process.env.render_img + fileName
        
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
    },
    fetchProduct: async (req,res) => {
        const page = parseInt(req.query.page) || 1
        const limit = 5
        const search = req.query.search || ""
        const offset = limit * (page - 1)

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
                ['name']
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
    const limit = 5
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