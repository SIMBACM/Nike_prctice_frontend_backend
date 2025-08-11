let mongoose = require('mongoose')

let AddressSchema = mongoose.Schema({
    Fullname: {
        type: String
    },
    Phonenumber: {
        type: String
    },
    Alternatenumber: {
        type: String
    },
    Pincode: {
        type: String
    },
    State: {
        type: String
    },
    City: {
        type: String
    },
    Landmark: {
        type: String
    },
    Housenumber: {
        type: String
    },
    Area: {
        type: String
    },
    Addresstype: {
        type: String
    }
});

let Addressmodel = mongoose.model('Address', AddressSchema)
module.exports = { Addressmodel }