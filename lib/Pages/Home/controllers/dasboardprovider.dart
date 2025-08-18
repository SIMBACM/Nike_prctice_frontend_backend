import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nike_prctice/Pages/Home/controllers/services/homeapi.dart';
import 'package:nike_prctice/Pages/Home/models/addressmodel.dart';
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';
import 'package:nike_prctice/Pages/Home/view/addresspage.dart';
import 'package:nike_prctice/Pages/Home/view/bag.dart';
import 'package:nike_prctice/Pages/Home/view/ordersummary.dart';
import 'package:nike_prctice/utils/commonutils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Dasboardprovider extends ChangeNotifier {
  // variables
  List<Welcome> products = [];
  List<Welcome> favorites = [];
  List<Welcome> cart = [];
  List<Address> address = [];
  bool isLoading = true;
  int currentindex = 0;
  int count = 1;
  String? selectedsize;
  final List<String> quantity = ['1', '2', '3', '4', '5'];
  String? selectedlocation;
  String? selectedPaymentMethod;
  TextEditingController fullname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController alternatephnonenumber = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController houseno = TextEditingController();
  TextEditingController area = TextEditingController();

  int selectedindex = 0;
  String? selectedUPIname = 'UPI';

  void itemindex(index) {
    selectedindex = index;
  }

  // function for paymentmethods

  void paymentmethod(String value) {
    selectedPaymentMethod = value;
    notifyListeners();
  }

  void increment(int index) {
    cart[index].quantity++;
    print('okey');
    notifyListeners();
  }

  void decrement(int index) {
    if ((cart[index].quantity ?? 0) > 0) {
      cart[index].quantity = (cart[index].quantity ?? 0) - 1;
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

  // Function for selection of Upi

  void selectionUpiMethod(String value) {
    selectedUPIname = value;
    notifyListeners();
  }

  // function for selected location
  void location(String locationtytpe) {
    selectedlocation = locationtytpe;
    notifyListeners();
  }

  void size(String size) {
    if (selectedsize == size) {
      selectedsize = '';
    } else {
      selectedsize = size;
    }
    notifyListeners();
  }

  // function for color change

  bool isSelected(String locationtytpe) {
    return selectedlocation == locationtytpe;
  }

  // Function for selection size color change
  bool issizeseleted(String size) {
    return selectedsize == size;
  }

  // get delivery
  double getDelivery() {
    return 1250.0;
  }

  // Load products from api function
  Future<void> loadproducts() async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedProducts = await ProductApiServices().fetchProducts();
      final favList = await ProductApiServices()
          .fetchFavourites(); // your API call

      final favIds = favList.map((f) => f.id).toSet();
      products = fetchedProducts.map((p) {
        p.isFavorite = favIds.contains(p.id);
        return p;
      }).toList();
    } catch (e) {
      print("Error loading products: $e");
    }

    isLoading = false;
    notifyListeners();
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
    String size,
    int quantity,
  ) async {
    try {
      final response = await ProductApiServices().storetocart(
        title,
        thumbnail,
        category,
        price,
        tags,
        size,
        quantity,
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
  // function for storing address

  void sendvaluestostoreaddress(BuildContext context) async {
    try {
      final response = await ProductApiServices().storeaddress(
        fullname.text,
        phonenumber.text,
        alternatephnonenumber.text,
        pincode.text,
        state.text,
        city.text,
        landmark.text,
        houseno.text,
        area.text,
        selectedlocation.toString(),
      );
      if (response['message'] == 'Address saved successfully') {
        print(response);
        MessengerUtil.showSnackBar(context, 'Address completed');
        NavigationUtil.push(context, Ordersummary());
      }
    } catch (e) {
      MessengerUtil.showSnackBar(context, 'Failed to add $e');
    }
  }

  // load address

  Future<void> loadAddress() async {
    try {
      final data = await ProductApiServices().fetchaddress();
      print("Fetched Address Data: $data");
      address = data;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching products:$e');
      isLoading = false;
      notifyListeners();
    }
  }

  void sendValuesToUpdateCart(BuildContext context, String userId) async {
    try {
      final items = cart.map((item) {
        final qty = item.quantity;
        final itemSubtotal = item.price * qty;

        return {
          'id': item.id,
          'price': item.price,
          'quantity': qty,
          'subtotal': itemSubtotal,
          'delivery': getDelivery(),
          'total': itemSubtotal + getDelivery(),
        };
      }).toList();

      final response = await ProductApiServices().updatecartItems(
        userId,
        items,
      );

      if (response['message'] == 'Cart items updated successfully') {
        print(response);
        NavigationUtil.push(context, Addresspage());
      }
    } catch (e) {
      print(e);
      MessengerUtil.showSnackBar(context, '$e');
    }
  }
}
