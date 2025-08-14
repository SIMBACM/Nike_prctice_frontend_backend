const express = require('express');
const productrouter = express.Router();
const mongoose = require('mongoose');
const { ProductModel } = require('../model/productmodel');


// Storing favorite products
productrouter.post('/favourite-products', async (req, res) => {
    const { title, category, price, thumbnail, isFavorite } = req.body;
    console.log(req.body)

    try {
        const existing = await ProductModel.findOne({ title });
        if (existing) {
            return res.status(404).json({ message: 'Already favourited', data: existing })
        }
        const favorite = new ProductModel({ title, category, price, thumbnail, isFavorite });
        await favorite.save();
        res.status(200).json({ message: 'Added to favorites', data: favorite });
    } catch (e) {
        console.error('Error saving favorite:', e);
        res.status(500).json({ message: 'Server error', e });

    }
});

// Fetching stored favorite Products
productrouter.get('/show-products', async (req, res) => {
    try {
        const favorite = await ProductModel.find()
        res.status(200).json({ message: 'Fetched successfully', data: favorite })
    } catch (e) {
        console.error('Feteching failed', e)
        res.status(404).json({ message: 'Failed', e })
    }
});




module.exports = productrouter;