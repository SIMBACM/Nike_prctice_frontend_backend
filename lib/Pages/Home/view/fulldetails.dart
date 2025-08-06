import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';

class Fulldetails extends StatelessWidget {
  final Welcome product;

  const Fulldetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Images
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(product.images![index]),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Title
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Price
            Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 8),
            // Category & Brand
            Text("Category: ${product.category}"),
            Text("Brand: ${product.brand}"),
            SizedBox(height: 8),
            // Tags
            Text("Tags: ${product.tags?.join(', ') ?? 'N/A'}"),
            SizedBox(height: 8),
            // Description
            Text(
              product.description.toString(),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Dimensions
            Text(
              "Dimensions (WxHxD): ${product.dimensions?.width} x ${product.dimensions?.height} x ${product.dimensions?.depth}",
            ),
            // Stock & Availability
            Text("Stock: ${product.stock}"),
            Text("Status: ${product.availabilityStatus}"),
            SizedBox(height: 8),
            // Shipping & Warranty
            Text("Shipping: ${product.shippingInformation}"),
            Text("Warranty: ${product.warrantyInformation}"),
            SizedBox(height: 8),
            // Reviews
            Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...?product.reviews?.map(
              (review) => ListTile(
                title: Text(review.reviewerName ?? ''),
                subtitle: Text(review.comment ?? ''),
                trailing: Text("${review.rating}/5"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
