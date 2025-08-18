import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nike_prctice/Pages/Home/models/addressmodel.dart';
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';
import 'package:nike_prctice/constants/Links.dart';

class ProductApiServices {
  //  frontend req for mens products
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

  // frontend req for womens product

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
  // frontend req for store favourites

  Future<dynamic> storeFavourites(
    String userId,
    String title,
    String category,
    String price,
    String thumbnail,
    bool isFavorite,
  ) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.postFav);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        'userId': userId,
        'title': title,
        'category': category,
        'price': price,
        'thumbnail': thumbnail,
        'isFavorite': isFavorite,
      }),
    );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('${responseBody['message']}');
    }
  }

  // frontend req for Fetch favourites

  Future<List<Welcome>> fetchFavourites(String userId) async {
    var client = http.Client();
    var links = LLinks();
    var apiurl = Uri.parse(links.getFav(userId));
    final response = await client.get(apiurl);
    print('Raw response: ${response.body}');
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

  // frontend req for store to cart
  Future<dynamic> storetocart(
    String userId,
    String title,
    String thumbnail,
    String category,
    String price,
    String tags,
    String size,
    int quantity,
    String subtotal,
    String delivery,
    String total,
  ) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.postcart);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        'userId': userId,
        'title': title,
        'category': category,
        'price': price,
        'thumbnail': thumbnail,
        'tags': tags,
        'size': size,
        'quantity ': quantity,
        'subtotal': subtotal,
        'delivery': delivery,
        'total': total,
      }),
    );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('${responseBody['message']}');
    }
  }

  // frontend req for fetch from cart
  Future<List<Welcome>> fetchCartproducts(String userId) async {
    var client = http.Client();
    var links = LLinks();
    var apiurl = Uri.parse(links.getcart(userId));
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

  // frontend req for delete product from cart

  Future<dynamic> deleteproduct(String id) async {
    var client = http.Client();
    var apiurl = Uri.parse('${LLinks.deletecart}/$id');
    var response = await client.delete(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
    );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('${responseBody['message']}');
    }
  }

  // frontend call for address

  Future<dynamic> storeaddress(
    String fullname,
    String phonenumber,
    String alternatenumber,
    String pincode,
    String state,
    String city,
    String landmark,
    String housenumber,
    String area,
    String addresstype,
  ) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.postaddress);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        'Fullname': fullname,
        'Phonenumber': phonenumber,
        'Alternatenumber': alternatenumber,
        'Pincode': pincode,
        'State': state,
        'City': city,
        'Landmark': landmark,
        'Housenumber': housenumber,
        'Area': area,
        'Addresstype': addresstype,
      }),
    );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('Failed to store${responseBody['message']}');
    }
  }

  // Front end call for showing address
  Future<List<Address>> fetchaddress() async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.getaddress);
    final response = await client.get(apiurl);
    var jsonBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List data = jsonBody['data'] is List
          ? jsonBody['data']
          : [jsonBody['data']];
      return data.map((item) => Address.fromJson(item)).toList();
    } else {
      throw Exception('${jsonBody['message']}');
    }
  }

  // frontend calling for update cart
  Future<dynamic> updatecart(
    String userId,
    String title,
    double subtotal,
    double delivery,
    double total,
    int quantity,
  ) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.updatecart);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        'userId': userId,
        'title': title,
        'subtotal': subtotal,
        'delivery': delivery,
        'total': total,
        'quantity': quantity,
      }),
    );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('Failed to store${responseBody['message']}');
    }
  }

  // Decrease quantity

  Future<dynamic> decreasecart(String userId, String title) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.decreasecart);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({'userId': userId, 'title': title}),
    );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('Failed to store${responseBody['message']}');
    }
  }
}
