import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/splashscreen/splashscreen2.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class Splashscreen1 extends StatelessWidget {
  const Splashscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Images.splashimage, fit: BoxFit.cover),
          ),
          Positioned(
            top: 250,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Images.mainvector),
                SizedBox(height: 10),
                commonText(
                  text: 'To personalise your experience',
                  color: AppColors.splashText,
                  fontSize: 20,
                ),
                commonText(
                  text: 'and connect you',
                  color: AppColors.splashText,
                  fontSize: 20,
                ),
                commonText(
                  text: 'to sport.',
                  color: AppColors.splashText,
                  fontSize: 20,
                ),
                SizedBox(height: 400),
                SizedBox(
                  width: 370,
                  child: commonButton(
                    text: 'Get Started',
                    textColor: AppColors.splashButtonText,
                    fontSize: 18,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Splashscreen2(),
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
