import 'dart:convert';

import 'package:http/http.dart' as http;

void fetchProducts() async {
  final url = Uri.parse('https://fakestoreapi.com/products');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    print(data); 
  } else {
    print('Failed to fetch products. Status: ${response.statusCode}');
  }
}
