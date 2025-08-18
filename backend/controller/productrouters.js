const express = require('express');
const productrouter = express.Router();
const mongoose = require('mongoose');
const { ProductModel } = require('../model/productmodel');



// productrouter.post('/store-product', async (req, res) => {
//     try {
//         const productdata = req.body
//         const product = await ProductModel(productdata);
//         await product.save()
//         res.status(200).json({ message: "Product saved for all users", product });
//     } catch (err) {
//         res.status(500).json({ error: "Error saving product", details: err.message });
//     }

// })


// productrouter.get('/get-products', async (req, res) => {
//     try {
//         const products = await ProductModel.find();
//         res.json({ products });
//     } catch (err) {
//         res.status(500).json({ error: "Error fetching products" });
//     }
// });


// Storing favorite products
productrouter.post('/favourite-products', async (req, res) => {
    const { userId, title, category, price, thumbnail, isFavorite } = req.body;
    console.log(req.body)

    try {
        if (!userId) {
            return res.status(400).json({ message: 'UserId is required' });
        }
        const existing = await ProductModel.findOne({ title, user: userId });
        if (existing) {
            return res.status(404).json({ message: 'Already favourited', data: existing })
        }
        const favorite = new ProductModel({ title, category, price, thumbnail, isFavorite, user: userId });
        await favorite.save();
        res.status(200).json({ message: 'Added to favorites', data: favorite });
    } catch (e) {
        console.error('Error saving favorite:', e);
        res.status(500).json({ message: 'Server error', e });

    }
});


productrouter.get('/show-products/:userId', async (req, res) => {
    const { userId } = req.params;

    try {
        const userObjectId = new mongoose.Types.ObjectId(userId);

        const favorite = await ProductModel.find({ user: userObjectId });

        res.status(200).json({ message: 'Fetched successfully', data: favorite });
    } catch (e) {
        console.error('Fetching failed', e);
        res.status(404).json({ message: 'Failed', e });
    }
});





module.exports = productrouter;