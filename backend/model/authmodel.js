let mongoose = require('mongoose')

let AuthSchema = mongoose.Schema({
    Firstname: {
        type: String,
    },
    Lastname: {
        type: String,
    },

    Email: {
        type: String,
        unique: true,
    },
    Password: {
        type: String,
    },
    Day: {
        type: String,
    },
    Month: {
        type: String,
    },
    Year: {
        type: String,
    }
})

let Authmodel = mongoose.model("Authentication", AuthSchema)

module.exports = { Authmodel };