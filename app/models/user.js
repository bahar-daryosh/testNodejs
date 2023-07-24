const mongoose = require('mongoose')

const UserSchema = new mongoose.Schema({
    userId:{
        type:String,
        required:true
    },
	name:{
        type:String,
    },
})

const UserModel = mongoose.model ('User',UserSchema)
module.exports = UserModel