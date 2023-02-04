const multer = require('multer')
const {nanoid} = require('nanoid')

const fileUploader = ({
    destinationFolder = "",
    typeImg = "image"
}) => {
    const fileStorage = multer.diskStorage({
        destination : (req,file,cb) => {
           return cb(null, `${__dirname}/../public/${destinationFolder}`)
        },
        filename : (req,file,cb) => {
            const extension = file.mimetype.split("/")[1]
            const imgName = nanoid() 

            cb(null, `${imgName}.${extension}`)
        }
    })

    const uploader = multer({
        storage : fileStorage,
        fileFilter : (req,file,cb) => {
            if(file.mimetype.split("/")[0] != typeImg){
                return cb(new Error('file must be an image'))
            }
            cb(null, true)
        },
        limits : {
            fileSize :5000
        },
    })

    return uploader
}

module.exports = fileUploader