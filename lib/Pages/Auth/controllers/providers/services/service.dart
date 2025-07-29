import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nike_prctice/constants/Links.dart';

class PostApiServices {
  // email otp send
  Future<dynamic> emailotpsend(String email) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.emailotpLink);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: json.encode(<String, String>{"sEmail": email}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  // email verify API
  Future<dynamic> resetemailotpverify(String email, String otp) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.emailotpverifyLink);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: json.encode(<String, String>{"sEmail": email, "otp": otp}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  // SIGN UP API

  Future<dynamic> signUp(
    String firstname,
    String lastname,
    String password,
    String day,
    String month,
    String year,
    String email,
  ) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.signUpLink);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        "sFirstName": firstname,
        "sSurname": lastname,
        "sPassword": password,
        "sDay": day,
        "sMonth": month,
        "sYear": year,
        'Email': email,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to sign up. Status: ${response.statusCode}");
    }
  }

  // Signin
  Future<dynamic> signin(String email) async {
    var client = http.Client();
    var apiurl = Uri.parse(LLinks.signinLink);
    var response = await client.post(
      apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: json.encode(<String, String>{
        "sEmail": email,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  
}
