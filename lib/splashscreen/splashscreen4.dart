import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/splashscreen/splash_screen.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class Splashscreen4 extends StatelessWidget {
  const Splashscreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Images.splashimage, fit: BoxFit.cover),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                commonText(
                  text: 'Get personalised ads\n by enabling app\n traking',
                  color: AppColors.secondary,
                  fontSize: 28,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(Images.mainvector, width: 27, height: 11),
                        SizedBox(width: 20),
                        commonText(
                          text:
                              'Get personalised Nike ads on partner\nplatforms based on your app activity',
                          fontSize: 17,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(Images.settings, width: 24, height: 24),
                        SizedBox(width: 20),
                        commonText(
                          text:
                              'On the next prompt, if you select\n “Ask App Not to Track”, you may see \nless relevant Nike ads.',
                          fontSize: 17,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 60),
                commonTextButton(
                  onPressed: () {},
                  text: 'Learn more',
                  fontSize: 16,
                  textColor: AppColors.secondary,
                  underline: true,
                  underlineColor: AppColors.secondary,
                ),
                SizedBox(height: 70),
                commonText(
                  text:
                      'On iOS, your permission is required to \ntrack your activity on this \napp on this device. This can be updated at any time\n from your device settings',
                  color: Colors.white,
                ),
                SizedBox(height: 110),
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
                          builder: (context) => SplashScreen(),
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
