import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';
import 'package:nike_prctice/constants/Links.dart';

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
  // Api for favourites

  Future<dynamic> storeFavourites(
    String title,
    String category,
    String price,
    String thumbnail,
    bool isFavorite
  ) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.postFav);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        'title': title,
        'category': category,
        'price': price,
        'thumbnail': thumbnail,
        'isFavorite':isFavorite
      }),
    );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('${responseBody['message']}');
    }
  }

  // Fetch favourites

  Future<List<Welcome>> fetchFavourites() async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.getFav);
    final response = await client.get(apiurl);
    var jsonBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List data = jsonBody['data'] is List
          ? jsonBody['data']
          : [jsonBody['data']];
      return data.map((item) => Welcome.fromJson(item)).toList();
    } else {
      throw Exception('${jsonBody['message']}');
    }
  }
}
