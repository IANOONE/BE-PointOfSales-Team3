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


app.use("/auth",route.authRoute)

app.listen(PORT, ()=> {
    console.log(`API is running on PORT ${PORT}`);
})