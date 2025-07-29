import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/providers/authprovider.dart';
import 'package:nike_prctice/splashscreen/splashscreen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Authprovider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen1(),
      ),
    );
  }
}
