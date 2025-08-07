import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nike_prctice/Pages/Home/controllers/services/homeapi.dart';

import 'package:nike_prctice/Pages/Home/models/productmodel.dart';
import 'package:nike_prctice/Pages/Home/view/bag.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/utils/commonutils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Dasboardprovider extends ChangeNotifier {
  // variables
  List<Welcome> products = [];
  List<Welcome> favorites = [];
  List<Welcome> cart = [];
  bool isLoading = true;
  int currentindex = 0;
  final List<String> quantity = ['1', '2', '3', '4', '5'];
  TextEditingController fullname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController alternatephnonenumber = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController houseno = TextEditingController();
  TextEditingController area = TextEditingController();

  // update quantity function
  void updateQty(int index, String? qty) {
    if (qty != null) {
      cart[index].selectedQty = int.parse(qty);
      notifyListeners();
    }
  }

  // bottom navigation function
  void bottomnavigation(index) {
    currentindex = index;
    notifyListeners();
  }

  // Toggle favourites function
  void toggleFavoriteStatus(Welcome product) {
    final index = products.indexOf(product);
    if (index != -1) {
      products[index].isFavorite = !products[index].isFavorite;
      notifyListeners();
    }
  }

  // Load products from api function
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

  // Loading favourites
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

  // Load women Products
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

  // Function for storing favourites
  void sendvaluestofavapi(
    BuildContext context,
    String title,
    String category,
    String price,
    String thumbnail,
    bool isFavorite,
  ) async {
    try {
      final response = await ProductApiServices().storeFavourites(
        title,
        category,
        price,
        thumbnail,
        isFavorite,
      );
      if (response['message'] == 'Added to favorites') {
        print(response);
        MessengerUtil.showSnackBar(context, 'Added to favorites');
      }
    } catch (e) {
      MessengerUtil.showSnackBar(context, 'Failed to add $e');
    }
  }

  // Function for storing into cart
  void sendvaluestocartapi(
    BuildContext context,
    String title,
    String category,
    String price,
    String thumbnail,
    String tags,
  ) async {
    try {
      final response = await ProductApiServices().storetocart(
        title,
        thumbnail,
        category,
        price,
        tags,
      );
      if (response['message'] == 'Added to Cart') {
        print(response);
        MessengerUtil.showSnackBar(context, 'Added to Cart');
        Navigator.push(context, MaterialPageRoute(builder: (_) => Bagpage()));
      }
    } catch (e) {
      MessengerUtil.showSnackBar(context, 'Failed to add $e');
    }
  }

  // Funtion for load cart
  Future<void> loadCart() async {
    try {
      final data = await ProductApiServices().fetchCartproducts();
      print('Fetched ${data.length} products');
      cart = data;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching products:$e');
      isLoading = false;
      notifyListeners();
    }
  }

  // Function for delete from cart

  void sendvaluestodeletecartapi(String id, BuildContext context) async {
    try {
      final response = await ProductApiServices().deleteproduct(id);
      if (response['message'] == 'deleted successfully') {
        MessengerUtil.showSnackBar(context, 'Deleted sucessfully');
        cart.removeWhere((item) => item.id == id);
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching products:$e');
      MessengerUtil.showSnackBar(context, 'Failed $e');
      notifyListeners();
    }
  }

  // Function to share the url

  Future<void> shareProduct(
    BuildContext context,
    String urlToShare,
    String imageUrl,
  ) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/shared_image.jpg');
        await file.writeAsBytes(bytes);

        await Share.shareXFiles([XFile(file.path)], text: urlToShare);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to load image')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error sharing: $e')));
    }
  }

  // Validation

  Future<bool> validateall(
    BuildContext context,
    GlobalKey<FormState> key,
  ) async {
    final formState = key.currentState;
    if (formState != null && formState.validate()) {
      MessengerUtil.showSnackBar(
        context,
        'Validation Sucessfull',
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.validIconGreen,
      );
      return true;
    } else {
      MessengerUtil.showSnackBar(
        context,
        'Validation Failed',
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.accent,
      );
      return false;
    }
  }
}
