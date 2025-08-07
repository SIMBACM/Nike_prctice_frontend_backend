import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/authprovider.dart';
import 'package:nike_prctice/Pages/Auth/view/signupsplash.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Signupart3 extends StatefulWidget {
  final String? prefilledname;
  const Signupart3({super.key,this.prefilledname});

  @override
  State<Signupart3> createState() => _Signupart3State();
}

class _Signupart3State extends State<Signupart3> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
      builder:(context,signup3model,child)=> Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Row(children: [Image.asset(Images.nikevector)]),
                SizedBox(height: TSizes.spaceBtwInputFields),
                SizedBox(height: TSizes.spaceBtwInputFields),
                commonText(
                  text: "You have been signed in successfully.",
                  fontSize: TSizes.lg,
                  fontWeight: TSizes.bold,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 150,
                    child: commonButton(
                      text: 'Continue',
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signupsplash(prefilledname:widget.prefilledname)),
                        );
                      },
                      backgroundColor: Color(0xFF130329),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
