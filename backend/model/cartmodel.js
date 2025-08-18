const mongoose = require('mongoose');

const DimensionsSchema = new mongoose.Schema({
    width: Number,
    height: Number,
    depth: Number,
}, { _id: false });

const MetaSchema = new mongoose.Schema({
    createdAt: Date,
    updatedAt: Date,
    barcode: String,
    qrCode: String,
}, { _id: false });

const ReviewSchema = new mongoose.Schema({
    rating: Number,
    comment: String,
    date: Date,
    reviewerName: String,
    reviewerEmail: String,
}, { _id: false });

const CartSchema = new mongoose.Schema({
    id: String,
    title: String,
    description: String,
    category: String,
    price: Number,
    discountPercentage: Number,
    rating: Number,
    stock: Number,
    tags: [String],
    brand: String,
    sku: String,
    weight: Number,
    dimensions: DimensionsSchema,
    warrantyInformation: String,
    shippingInformation: String,
    availabilityStatus: String,
    reviews: [ReviewSchema],
    returnPolicy: String,
    minimumOrderQuantity: Number,
    meta: MetaSchema,
    images: [String],
    thumbnail: String,
    isFavorite: {
        type: Boolean,
        default: false,
    },
    size: {
        type: String,
    },
    quantity: {
        type: Number,
        default: 1
    },
    subtotal: {
        type: String
    },
    delivery: {
        type: String
    },
    total: {
        type: String
    }
});

const CartModel = mongoose.model('Cart', CartSchema);

module.exports = { CartModel };
