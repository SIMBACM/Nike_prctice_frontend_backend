import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/splashscreen/splashscreen4.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class Splashscreen3 extends StatelessWidget {
  const Splashscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Images.splashimage, fit: BoxFit.cover),
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                commonText(
                  text:
                      'Want to use location\n Services to help you \nfind the closest Nike\n Store, access in-store\n and location-based \nfeatures, and see \nexperiences near you?',
                  color: AppColors.secondary,
                  fontSize: 28,
                ),
                SizedBox(height: 400),
                Center(
                  child: commonButton(
                    width: 200,
                    text: 'Next',
                    textColor: AppColors.primary,
                    fontSize: 18,
                    backgroundColor: AppColors.secondary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Splashscreen4(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
