const express = require("express")
const app = express()
const dotenv = require("dotenv").config()
const PORT = process.env.PORT
const route = require("./routes")
const db = require("./models")
const {sequelize} = require("./models")


app.use(express.json())
app.use(express.urlencoded({extended: false}))

// db.sequelize.sync({alter:true})


app.use("/image", express.static(`${__dirname}/public/products_img`))
app.use("/auth",route.authRoute)
app.use("/product",route.productRoute)

app.listen(PORT, ()=> {
    console.log(`API is running on PORT ${PORT}`);
})