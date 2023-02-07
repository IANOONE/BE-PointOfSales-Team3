const express = require("express")
const app = express()
const cookie_parser = require('cookie-parser')
require("dotenv").config()
const PORT = process.env.PORT || 2000
const route = require("./routes")
const db = require("./models")
const {sequelize} = require("./models")
const cors = require("cors")


app.use(cors({credentials: true} ))
app.use(cookie_parser())
app.use(express.json())
app.use(express.urlencoded({extended: false}))

// db.sequelize.sync({alter:true})  


app.use("/image", express.static(`${__dirname}/public/products_img`))
app.use("/auth",route.authRoute)
app.use("/product",route.productRoute)
app.use("/category",route.categoryRoute)

app.listen(PORT, ()=> {
    console.log(`API is running on PORT ${PORT}`);
})