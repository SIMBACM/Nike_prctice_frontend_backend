import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/view/sigupsplash2.dart';
import 'package:nike_prctice/constants/images.dart';

class Signupsplash extends StatefulWidget {
  final String? prefilledname;
  const Signupsplash({super.key,this.prefilledname});

  @override
  State<Signupsplash> createState() => _SignupsplashState();
}

class _SignupsplashState extends State<Signupsplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Sigupsplash2(prefilledname:widget.prefilledname)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 0, 73),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Image.asset(Images.nikelogo)],
        ),
      ),
    );
  }
}
