import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/view/main_page.dart';
import 'package:nike_prctice/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainPage()),
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
