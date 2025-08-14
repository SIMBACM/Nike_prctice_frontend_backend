class LLinks {
  // Auth Apis
  static const String emailotpLink =
      'http://192.168.1.5:3001/Apis/send-email-otp';
  static const String emailotpverifyLink =
      'http://192.168.1.5:3001/Apis/email-verify-otp';
  static const String signUpLink = 'http://192.168.1.5:3001/Apis/signup';
  static const String signinLink = 'http://192.168.1.5:3001/Apis/signin';

  // Home apis
  static const String postFav =
      'http://192.168.1.5:3001/product/favourite-products';
  static const String getFav = 'http://192.168.1.5:3001/product/show-products';
  static const String postcart = 'http://192.168.1.5:3001/cart/addtocart';
  static const String getcart =
      'http://192.168.1.5:3001/cart/show-cart-products';
  static const String deletecart = 'http://192.168.1.5:3001/cart/delete-item';
  static const String postaddress =
      'http://192.168.1.5:3001/payment/storeaddress';
  static const String getaddress =
      'http://192.168.1.5:3001/payment/show-address';
  static const String updatecart = 'http://192.168.1.5:3001/cart/update-cart';
}
