class LLinks {
  // Auth Apis
  static const String emailotpLink =
      'http://192.168.1.5:3001/Apis/send-email-otp';
  static const String emailotpverifyLink =
      'http://192.168.1.5:3001/Apis/email-verify-otp';
  static const String signUpLink = 'http://192.168.1.5:3001/Apis/signup';
  static const String signinLink = 'http://192.168.1.5:3001/Apis/signin';

  // Home apis
  static const String getproducts =
      'http://192.168.1.5:3001/product/get-products';
  static const String postFav =
      'http://192.168.1.5:3001/product/favourite-products';
  String getFav(String userId) {
    return 'http://192.168.1.5:3001/product/show-products/$userId';
  }

  static const String postcart = 'http://192.168.1.5:3001/cart/addtocart';
  String getcart(String userId) {
    return 'http://192.168.1.5:3001/cart/show-cart-products/$userId';
  }
  static const String deletecart = 'http://192.168.1.5:3001/cart/delete-item';
  static const String postaddress =
      'http://192.168.1.5:3001/payment/storeaddress';
  static const String getaddress =
      'http://192.168.1.5:3001/payment/show-address';
  static const String updatecart = 'http://192.168.1.5:3001/cart/update-cart';
  static const String decreasecart = 'http://192.168.1.5:3001/cart/decrease-cart';
}
