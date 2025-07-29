import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/providers/authprovider.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/validations/validation.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textfieldwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Consumer<Authprovider>(
      builder: (context, signup1model, child) => Form(
        key: _formKey,
        child: Scaffold(
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
                  commonText(
                    text: "Enter your mail to join us \n or sign in",
                    fontSize: TSizes.lg,
                    fontWeight: TSizes.bold,
                  ),
                  SizedBox(height: TSizes.defaultSpace),
                  Row(
                    children: [
                      commonText(
                        text: "India",
                        fontSize: TSizes.md,
                        fontWeight: FontWeight.w400,
                      ),
                      commonTextButton(
                        onPressed: () {},
                        text: 'Change',
                        underline: true,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  commonTextFormField(
                    labelText: "Email",
                    controller: signup1model.emailcontroller,
                    validator: validateEmail,
                    textStyle: TextStyle(color: Colors.black),
                    hintText: "Enter the email",
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.green,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  SizedBox(height: TSizes.defaultSpace),
                  RichText(
                    text: TextSpan(
                      text: "By continuing, I agree to Nike’s,",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: " and ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Terms and conditions",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 150,
                      child: commonButton(
                        text: 'Continue',
                        textColor: Colors.white,
                        onPressed: () async {
                          final isValid = await signup1model.validateall(
                            context,_formKey
                          );
                          if (isValid) {
                            signup1model.sendvaluestoemailotp(context);
                          }
                        },
                        backgroundColor: Color(0xFF130329),
                      ),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey[400], thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: commonText(
                          text: 'or continue with',
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey[400], thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      commonContainer(
                        height: TSizes.containerHeightMd,
                        width: 100,
                        color: Colors.white,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(
                          TSizes.buttonRadius,
                        ),
                        backgroundImage: DecorationImage(
                          image: AssetImage(Images.google),
                        ),
                        onTap: () {},
                      ),
                      commonContainer(
                        height: TSizes.containerHeightMd,
                        width: 100,
                        color: Colors.white,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(
                          TSizes.buttonRadius,
                        ),
                        backgroundImage: DecorationImage(
                          image: AssetImage(Images.facebook),
                        ),
                        onTap: () {},
                      ),
                      commonContainer(
                        height: TSizes.containerHeightMd,
                        width: 100,
                        color: Colors.white,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(
                          TSizes.buttonRadius,
                        ),
                        backgroundImage: DecorationImage(
                          image: AssetImage(Images.apple),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
