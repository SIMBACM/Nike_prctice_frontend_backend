import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/view/Loginpage.dart';
import 'package:nike_prctice/Pages/Auth/view/signUp.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Images.loginpicture, fit: BoxFit.cover),
          ),
          Positioned(
            top: 580,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Images.mainvector),
                SizedBox(height: 10),
                commonText(
                  text: 'Bringing Nike Members the best',
                  color: Colors.white,
                  fontSize: 20,
                ),
                commonText(
                  text: 'products, inspiration and stories',
                  color: Colors.white,
                  fontSize: 20,
                ),
                commonText(
                  text: 'in sport.',
                  color: Colors.white,
                  fontSize: 20,
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  children: [
                    commonButton(
                      text: 'Signup',
                      textColor: Colors.black,
                      fontSize: 18,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                    ),
                    SizedBox(width: 30),
                    commonButton(
                      text: 'Signin',
                      backgroundColor: Colors.black,
                      fontSize: 18,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
