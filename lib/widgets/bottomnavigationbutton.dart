import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/Pages/Home/view/shop.dart';

Widget commonBottomNavigationBar(BuildContext context, Dasboardprovider shopmodel) {
  return BottomNavigationBar(
    currentIndex: shopmodel.currentindex,
    onTap: (value) {
      shopmodel.bottomnavigation(value);
      switch (value) {
        case 0:
          Navigator.pushReplacementNamed(context, '/home');
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Shop()),
          );
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/wishlist');
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/cart');
          break;
        case 4:
          Navigator.pushReplacementNamed(context, '/profile');
          break;
      }
    },
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    selectedFontSize: 14.0,
    unselectedFontSize: 12.0,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    elevation: 8.0,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(LucideIcons.shoppingBag), label: 'Bag'),
      BottomNavigationBarItem(icon: Icon(LucideIcons.heart), label: 'Wishlist'),
      BottomNavigationBarItem(icon: Icon(LucideIcons.shoppingCart), label: 'Cart'),
      BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profile'),
    ],
  );
}
