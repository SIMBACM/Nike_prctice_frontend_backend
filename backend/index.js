let express = require('express');
let mongoose = require('mongoose');
const router = require('./controller/authrouter');
const productrouter = require('./controller/productrouters');
require('dotenv').config();
let app = express()

app.use(express.json())


mongoose.connect(process.env.Mongodb)
    .then(() => console.log("MongoDb is connected"))
    .catch((err) => console.log("MongoDB connection error:", err.message));


app.use('/Apis', router)
app.use('/product',productrouter)

app.listen(process.env.PORT, () => {
    console.log('Port is running')
})