import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/services/homeapi.dart';

import 'package:nike_prctice/Pages/Home/models/productmodel.dart';
import 'package:nike_prctice/utils/commonutils.dart';

class Dasboardprovider extends ChangeNotifier {
  List<Welcome> products = [];
  List<Welcome> favorites = [];
  bool isLoading = true;
  int currentindex = 0;

  void bottomnavigation(index) {
    currentindex = index;
    notifyListeners();
  }

  void toggleFavoriteStatus(Welcome product) {
    final index = products.indexOf(product);
    if (index != -1) {
      products[index].isFavorite = !products[index].isFavorite;
      notifyListeners();
    }
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

  Future<void> loadFavoirites() async {
    try {
      final data = await ProductApiServices().fetchFavourites();
      print('Fetched ${data.length} products');
      favorites = data;
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

  void sendvaluestofavapi(
    BuildContext context,
    String title,
    String category,
    String price,
    String thumbnail,
    bool isFavorite
  ) async {
    try {
      final response = await ProductApiServices().storeFavourites(
        title,
        category,
        price,
        thumbnail,
        isFavorite
      );
      if (response['message'] == 'Added to favorites') {
        print(response);
        MessengerUtil.showSnackBar(context, 'Added to favorites');
      }
    } catch (e) {
      MessengerUtil.showSnackBar(context, 'Failed to add $e');
    }
  }
}
