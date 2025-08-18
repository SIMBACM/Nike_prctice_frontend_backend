const express = require('express');
const cartrouter = express.Router();
const mongoose = require('mongoose');
const { CartModel } = require('../model/cartmodel');



// Api for add to cart
cartrouter.post("/addtocart", async (req, res) => {
    const { title, thumbnail, category, tags, price, size, quantity } = req.body
    console.log(req.body)
    try {
        const existing = await CartModel.findOne({ title })
        if (existing) {
            return res.status(404).json({ message: 'Already Carted', data: existing })
        }
        const Cart = new CartModel({ title, thumbnail, category, tags, price, size, quantity });
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
        const { userId, items } = req.body;

        if (!userId || !Array.isArray(items) || items.length === 0) {
            return res.status(400).json({ message: 'User ID and cart items are required' });
        }

        // Find user's cart
        const cart = await CartModel.findOne({ userId });
        if (!cart) {
            return res.status(404).json({ message: 'Cart not found' });
        }

        // Update each item quantity in cart
        items.forEach(updatedItem => {
            const existingItem = cart.items.find(i => i.productId === updatedItem.productId);
            if (existingItem) {
                if (updatedItem.quantity !== undefined) {
                    existingItem.quantity = updatedItem.quantity;
                }
                if (updatedItem.price !== undefined) {
                    existingItem.price = updatedItem.price; // optional
                }
            }
        });

        // Recalculate prices
        cart.subtotal = cart.items.reduce((sum, i) => sum + (i.price * i.quantity), 0);
        cart.delivery = cart.subtotal > 500 ? 0 : 50; // example: free delivery over ₹500
        cart.total = cart.subtotal + cart.delivery;

        // Save updated cart
        await cart.save();

        return res.status(200).json({
            message: 'Cart updated successfully',
            cart
        });

    } catch (e) {
        console.error('Error updating cart:', e);
        res.status(500).json({ message: 'Server error', error: e.message });
    }
});


module.exports = cartrouter;