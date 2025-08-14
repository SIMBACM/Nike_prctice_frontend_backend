const express = require('express');
const cartrouter = express.Router();
const mongoose = require('mongoose');
const { CartModel } = require('../model/cartmodel');



// Api for add to cart
cartrouter.post("/addtocart", async (req, res) => {
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
// Api for show cart products
cartrouter.get('/show-cart-products', async (req, res) => {
    try {
        const Cart = await CartModel.find()
        res.status(200).json({ message: 'Fetched successfully', data: Cart })
    } catch (e) {
        console.error('Feteching failed', e)
        res.status(404).json({ message: 'Failed', e })
    }
});

// Delete cart
cartrouter.delete('/delete-item/:id', async (req, res) => {
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

// update cart Api
cartrouter.post('/update-cart', async (req, res) => {
    try {
        const { id, quantity, subtotal, delivery, total } = req.body;
        if (!id) {
            return res.status(400).json({ message: 'Cart item ID is required' });
        }
        const updatedcart = await CartModel.findByIdAndUpdate(id, {
            quantity, subtotal, delivery, total
        }, { new: true });
        if (!updatedcart) {
            return res.status(404).json({ message: 'Cart item not found' });
        }
        return res.status(200).json({
            message: 'Cart updated successfully',
            cart: updatedcart
        });
    } catch (e) {
        console.error('Error updating cart:', e);
        res.status(500).json({ message: 'Server error', error: e.message });
    }
})

module.exports = cartrouter;