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
            }}, { transaction: t })
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
        return res.status(200).send(`New transaction with number ${data.TransactionId[0]}`)
    } catch (err) {
        await t.rollback();
        return res.status(400).send(err.message)
    }
    }
    
}

module.exports = transactionController