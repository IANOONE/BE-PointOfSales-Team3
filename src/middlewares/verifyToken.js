const jwt = require("jsonwebtoken")

const tokenVerify = (req,res, next) => {
    let token = req.headers.authorization
    console.log(token);

    if(!token){
        throw new Error('Access denied')
    }

    try{

    const checkToken = token.length > 0
    // console.log(checkToken);
    if(checkToken){
        token = token.split(" ")[1]
        console.log(token);
    }

    if(token === null || !token){
        throw new Error('Access denied')
    }

    const verifyUser = jwt.verify(token, process.env.secret_key)

    req.user = verifyUser
    next()

    }catch(err){
        console.log(err);

        return res.status(401).send(err)
    }
}

const checkRole = (req,res,next) => {
    if(!req.user.isAdmin){
        return res.status(401).send(`Access denied, Only Admin can access this page`)
    }
    
    next()
}

module.exports = {
    tokenVerify,
    checkRole
}