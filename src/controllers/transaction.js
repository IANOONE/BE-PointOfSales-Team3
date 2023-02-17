const db = require("../models")
const Transaction = db.transaction
const Transaction_detail = db.transaction_detail
const User = db.user
const {sequelize} = require("../models")
const { Op } = require("sequelize")
const moment = require("moment")

const transactionController = {
    create: async (req,res) => {
        const grand_total = req.body.grand_total
        const data = req.body.data

        const t = await sequelize.transaction();
        try {
            const findDate = moment().format('YYYY-MM-DD')
            let countOrder = await Transaction.count({where : {
                createdAt : {
                    [Op.substring] : findDate
                }
            }, transaction: t} )
            countOrder = countOrder + 1
            
        const dateNow = moment().format('DDMMYYYY')
        const id = 1
        
        const no_trans = dateNow + '000' + countOrder + "0" + id 
        console.log(no_trans);
        
        
        const transHead = await Transaction.create({"no_trans" : no_trans , "grand_total" : grand_total}, { transaction: t })
        if(!transHead){
            throw new Error('Create transaction failed')
        }
        data.forEach(e => {
            // added object data with transaction id when we create transaction headers
            e.TransactionId = transHead.dataValues.id
        });
        
        console.log(data);
        
        const transDetail = await Transaction_detail.bulkCreate(data, { transaction: t })
        if(!transDetail){
            throw new Error('Create transaction detail failed')
        }
        await t.commit();
        res.status(200).send(`New transaction with number ${no_trans}`)
    } catch (err) {
        await t.rollback();
        return res.status(400).send(err.message)
    }
    },
    fetchAll: async (req,res) => {
        const page =  parseInt(req.query.page) || 1
        const limit = 5
        const search = req.query.searchDate || ""
        const offset = limit * (page - 1)
        const sortBy = req.query.sortBy || "updatedAt"
        const order = req.query.order || "DESC"

        // console.log(employeeName);
        
        const t = await sequelize.transaction();
        try {
            const totalRows = await Transaction.count({
            where : {
                        updatedAt : {[Op.substring] : [search]} 
                    }, transaction : t })

        if(totalRows == 0) {
            throw new Error('Fetching data failed')
        }

        const totalPage = Math.ceil(totalRows / limit)

        const result = await Transaction.findAll({
            where : {
                        updatedAt : {[Op.substring] : [search]} 
            },
            offset : offset,
            limit : limit,
            order: [[sortBy, order]],
            transaction : t
        })
        if(totalRows == 0) {
            throw new Error('Fetching data failed')
        }

        await t.commit()
        res.status(200).json({
            result : result,
            page: page,
            limit: limit,
            totalRows: totalRows,
            totalPage: totalPage
        })
        } catch (err) {
           await t.rollback() 
           return res.status(400).send(err.message)
        } 
        
    },
    fetchDetail: async (req,res) => {
        const id = req.params.id

        try {
            const result = await Transaction_detail.findAll({where: {id: id}})
            if(!result){
                throw new Error(`Fetched detail data transaction id ${id} failed`)
            }
            return res.status(200).send({result})
        } catch (err) {
            return res.status(400).send(err.message)
        }

    }
    
}

module.exports = transactionController