import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/services/homeapi.dart';
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';

class Dasboardprovider extends ChangeNotifier {
  List<Welcome> products = [];
  bool isLoading = true;
  int currentindex = 0;

  void bottomnavigation(index) {
    currentindex = index;
    notifyListeners();
  }

  Future<void> loadproducts() async {
    try {
      final data = await ProductApiServices().fetchProducts();
      print('Fetched ${data.length} products');
      products = data;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching products:$e');
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadwomenproducts() async {
    try {
      final data = await ProductApiServices().fetchwomenProducts();
      print('Fetched ${data.length} products');
      products = data;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching products:$e');
      isLoading = false;
      notifyListeners();
    }
  }
}
