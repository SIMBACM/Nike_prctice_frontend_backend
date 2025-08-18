const express = require('express');
const cartrouter = express.Router();
const mongoose = require('mongoose');
const { CartModel } = require('../model/cartmodel');



// Api for add to cart
cartrouter.post("/addtocart", async (req, res) => {
    const { userId, title, thumbnail, category, tags, price, size, quantity, subtotal, delivery, total } = req.body
    console.log(req.body)
    try {
        const existing = await CartModel.findOne({ title, user: userId })
        if (existing) {
            return res.status(404).json({ message: 'Already Carted', data: existing })
        }
        const Cart = new CartModel({ user: userId, title, thumbnail, category, tags, price, size, quantity, subtotal, delivery, total });
        await Cart.save();
        res.status(200).json({ message: 'Added to Cart', data: Cart });
    } catch (e) {
        console.error('Error saving Cart:', e);
        res.status(500).json({ message: 'Server error', e });
    }

});
// Api for show cart products
cartrouter.get('/show-cart-products/:userId', async (req, res) => {
    const { userId } = req.params;
    try {
        const userObjectId = new mongoose.Types.ObjectId(userId);
        const Cart = await CartModel.find({ user: userObjectId })
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
    const { userId, title, quantity, subtotal, delivery, total } = req.body;

    if (!userId || !title || !quantity || subtotal === undefined || delivery === undefined || total === undefined) {
        return res.status(400).json({ message: 'Missing required fields' });
    }

    try {
        const existing = await CartModel.findOne({ title, user: userId });

        if (existing) {
            existing.quantity = quantity;
            existing.subtotal = subtotal;
            existing.delivery = delivery;
            existing.total = total;

            await existing.save();
            return res.status(200).json({ message: 'Cart updated', data: existing });
        } else {
            return res.status(404).json({ message: 'Cart item not found' });
        }

    } catch (e) {
        console.error('Error updating Cart:', e);
        res.status(500).json({ message: 'Server error', e });
    }
});


cartrouter.post('/decrease-cart', async (req, res) => {
    const { userId, title } = req.body;

    if (!userId || !title) {
        return res.status(400).json({ message: 'Missing required fields' });
    }

    try {
        const existing = await CartModel.findOne({ title, user: userId });

        if (!existing) {
            return res.status(404).json({ message: 'Cart item not found' });
        }

        // Decrease quantity by 1
        existing.quantity -= 1;

        // If quantity drops below 1, optionally remove the item
        if (existing.quantity < 1) {
            await CartModel.deleteOne({ _id: existing._id });
            return res.status(200).json({ message: 'Cart item removed', data: null });
        }

        // Recalculate subtotal and total
        existing.subtotal = existing.price * existing.quantity;
        existing.total = existing.subtotal + existing.delivery;

        await existing.save();
        return res.status(200).json({ message: 'Cart quantity decreased', data: existing });

    } catch (e) {
        console.error('Error decreasing Cart:', e);
        res.status(500).json({ message: 'Server error', error: e });
    }
});






module.exports = cartrouter;