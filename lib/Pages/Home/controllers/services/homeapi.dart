import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';

class ProductApiServices {
  //  api for mens products
  Future<List<Welcome>> fetchProducts() async {
    final url = Uri.parse('https://dummyjson.com/products/category/mens-shoes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = jsonDecode(response.body);
      final List<dynamic> products = jsonBody['products'] ?? [];

      return products.map((e) => Welcome.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  // api for womens product

  Future<List<Welcome>> fetchwomenProducts() async {
    final url = Uri.parse(
      'https://dummyjson.com/products/category/womens-shoes',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = jsonDecode(response.body);
      final List<dynamic> products = jsonBody['products'] ?? [];

      return products.map((e) => Welcome.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
  
}
