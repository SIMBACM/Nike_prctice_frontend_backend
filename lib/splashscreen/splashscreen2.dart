import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/splashscreen/splashscreen3.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class Splashscreen2 extends StatefulWidget {
  const Splashscreen2({super.key});

  @override
  State<Splashscreen2> createState() => _Splashscreen2State();
}

class _Splashscreen2State extends State<Splashscreen2> {
  @override
  Widget build(BuildContext context) {
    String selectedOption = 'mens';
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Images.splashimage, fit: BoxFit.cover),
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
          ),
          Positioned(
            top: 150,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Images.mainvector),
                SizedBox(height: 20),
                commonText(
                  text: 'Which products do you\nuse the most?',
                  color: Colors.white,
                  fontSize: 28,
                ),
                SizedBox(height: 60),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.mens),
                        CustomRadioButton(
                          isSelected: selectedOption == 'mens',
                          onTap: () {
                            setState(() {
                              selectedOption = 'mens';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.female),
                        CustomRadioButton(
                          isSelected: selectedOption == 'mens',
                          onTap: () {
                            setState(() {
                              selectedOption = 'mens';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                commonText(
                  text: 'Any others?',
                  color: Color(0xFF7C7C7C),
                  fontSize: 24,
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.mens),
                        CustomRadioButton(
                          isSelected: selectedOption == 'mens',
                          onTap: () {
                            setState(() {
                              selectedOption = 'mens';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.female),
                        CustomRadioButton(
                          isSelected: selectedOption == 'mens',
                          onTap: () {
                            setState(() {
                              selectedOption = 'mens';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Center(
                  child: commonButton(
                    width: 200,
                    text: 'Next',
                    textColor: Colors.black,
                    fontSize: 18,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Splashscreen3(),
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
