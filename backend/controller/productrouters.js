const express = require('express');
const productrouter = express.Router();
const mongoose = require('mongoose');
const { ProductModel } = require('../model/productmodel');
const { CartModel } = require('../model/cartmodel');


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

// Api for add to cart
productrouter.post("/addtocart", async (req, res) => {
    const { title, thumbnail, category, tags, price } = req.body
    console.log(req.body)
    try {
        const existing = await CartModel.findOne({ title })
        if (existing) {
            return res.status(404).json({ message: 'Already Carted', data: existing })
        }
        const Cart = new CartModel({ title, thumbnail, category, tags, price });
        await Cart.save();
        res.status(200).json({ message: 'Added to Cart', data: Cart });
    } catch (e) {
        console.error('Error saving Cart:', e);
        res.status(500).json({ message: 'Server error', e });
    }

});

// Show cart products
productrouter.get('/show-cart-products', async (req, res) => {
    try {
        const Cart = await CartModel.find()
        res.status(200).json({ message: 'Fetched successfully', data: Cart })
    } catch (e) {
        console.error('Feteching failed', e)
        res.status(404).json({ message: 'Failed', e })
    }
});

// Delete cart
productrouter.delete('/delete-item/:id', async (req, res) => {
    const id = req.params.id;
    try {
        const deleteditem = await CartModel.findByIdAndDelete(id)
        if (!deleteditem) {
            return res.status(404).json({ message: 'Item not found' });
        }
        res.status(200).json({ message: "deleted successfully", data: deleteditem })
    }
    catch (e) {
        console.error('deleting failed', e)
        console.error("Error deleting cart item:", e);
        res.status(500).json({ message: "Server error", e });
    }
});

module.exports = productrouter;