import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/view/Loginpage.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class Sigupsplash2 extends StatefulWidget {
  final String? prefilledname;
  const Sigupsplash2({super.key, this.prefilledname});

  @override
  State<Sigupsplash2> createState() => _Sigupsplash2State();
}

class _Sigupsplash2State extends State<Sigupsplash2> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 0, 73),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 217, left: 40),
              child: Row(
                children: [
                  Image.asset(Images.mainvector, width: 70, height: 24),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceMedium),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: commonText(
                text: 'Hi ${widget.prefilledname},Welcome to Nike.',
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: commonText(
                text: 'Thanks for becoming a \n Member!',
                color: Color(0xFF7C7C7C),
                fontSize: 18,
                fontWeight: TSizes.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 40),
              child: SizedBox(
                width: 138,
                height: 21,
                child: commonText(
                  text: 'Member Since 2025',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
