import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/providers/authprovider.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/validations/validation.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textfieldwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
      builder: (context, loginmodl, child) => Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200),
                Row(children: [Image.asset(Images.nikevector)]),
                SizedBox(height: TSizes.spaceBtwInputFields),
                commonText(
                  text: "Signin with email",
                  fontSize: TSizes.lg,
                  fontWeight: TSizes.bold,
                  color: AppColors.primary,
                ),
                SizedBox(height: TSizes.defaultSpace),
                commonText(
                  text: "Welcome to Nike family",
                  fontSize: TSizes.md,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                commonTextFormField(
                  labelText: "Email",
                  controller: loginmodl.emailcontroller,
                  validator: validateEmail,
                  textStyle: TextStyle(color: AppColors.primary),
                  hintText: "Enter the email",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(
                    Icons.check_circle,
                    size: 30,
                    color: AppColors.validIconGreen,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                    borderSide: BorderSide(color: AppColors.validIconGreen),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                SizedBox(
                  width: TSizes.buttonWidth,
                  child: commonButton(
                    text: 'Continue',
                    textColor: AppColors.secondary,
                    onPressed: () {
                      loginmodl.sendvaluestosigninapi(context);
                    },
                    backgroundColor: AppColors.authButtonBackground,
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
                        color: AppColors.grey,
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
                      color: AppColors.secondary,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                      backgroundImage: DecorationImage(
                        image: AssetImage(Images.google),
                      ),
                      onTap: () {},
                    ),
                    commonContainer(
                      height: TSizes.containerHeightMd,
                      width: 100,
                      color: AppColors.secondary,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                      backgroundImage: DecorationImage(
                        image: AssetImage(Images.facebook),
                      ),
                      onTap: () {},
                    ),
                    commonContainer(
                      height: TSizes.containerHeightMd,
                      width: 100,
                      color: AppColors.secondary,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
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
    );
  }
}
