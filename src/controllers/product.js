const db = require("../models")
const Product = db.product
const productController = {
    create: async (req,res) => {
        console.log(req.body);
        // get filename
        let fileName = req.file.filename
        const url = "localhost:2000/image/public/products_img/"
        // rewrite filename and add url
        fileName =  url + fileName
        try {
            // combine object req.body and added image name
            const data = {
                ...req.body,
                image : fileName
            }
            console.log(data);
            await Product.create({...data})
            return res.status(200).send("Success add new product")
        } catch(err){
            console.log(err);
            res.status(400).send(err)
        }
    }
}

module.exports = productController