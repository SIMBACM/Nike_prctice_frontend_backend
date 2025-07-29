import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/providers/authprovider.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/validations/validation.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/textfieldwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Signuppart2 extends StatefulWidget {
  final String? prefilledEmail;
  const Signuppart2({super.key, this.prefilledEmail});

  @override
  State<Signuppart2> createState() => _Signuppart2State();
}

class _Signuppart2State extends State<Signuppart2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
      builder: (context, signupmodel, child) => Form(
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
                    text: "Now let’s make you a Nike Member.",
                    fontSize: TSizes.lg,
                    fontWeight: TSizes.bold,
                  ),
                  SizedBox(height: TSizes.defaultSpace),
                  commonText(
                    text: "We’ve sent a code to",
                    fontSize: TSizes.md,
                    fontWeight: TSizes.extraBold,
                  ),
                  Row(
                    children: [
                      commonText(
                        text: '${widget.prefilledEmail}',
                        fontSize: TSizes.md,
                        fontWeight: TSizes.extraBold,
                      ),
                      commonTextButton(
                        onPressed: () {},
                        text: 'Edit',
                        underline: true,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  commonTextFormField(
                    labelText: "Code*",
                    validator: validateOtp,
                    controller: signupmodel.otpcontroller,
                    textStyle: TextStyle(color: Colors.black),
                    hintText: "Enter the code",
                    suffixIcon: Icon(
                      Icons.recycling,
                      size: 30,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      commonTextButton(
                        onPressed: () {},
                        text: "Resend code in 9s",
                        fontSize: 12,
                        textColor: Colors.black,
                        underline: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: commonTextFormField(
                          labelText: "First name*",
                          validator: validateFirstName,
                          controller: signupmodel.fistnamecontroller,
                          textStyle: TextStyle(color: Colors.black),
                          hintText: "Enter the First name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              TSizes.buttonRadius,
                            ),
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                      SizedBox(width: TSizes.spaceBtwSections),
                      SizedBox(
                        width: 170,
                        child: commonTextFormField(
                          labelText: "Surname*",
                          validator: validateLastName,
                          controller: signupmodel.surnamecontroller,
                          textStyle: TextStyle(color: Colors.black),
                          hintText: "Enter the Surname",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              TSizes.buttonRadius,
                            ),
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  commonTextFormField(
                    labelText: "Password*",
                    validator: validatePassword,
                    controller: signupmodel.passwordcontroller,
                    obscureText: signupmodel.ispasswordObscured,
                    textStyle: TextStyle(color: Colors.black),
                    hintText: "Enter the Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        signupmodel.toggleabilitypassword();
                      },
                      icon: Icon(Icons.visibility),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  SizedBox(height: TSizes.defaultSpace),
                  commonText(text: "x Minimum of 8 characters", fontSize: 12),
                  commonText(
                    text: 'X Uppercase, lowercase letters and one number',
                    fontSize: 12,
                  ),
                  SizedBox(height: TSizes.defaultSpace),
                  commonText(
                    text: 'Date of Birth',
                    fontSize: 14,
                    fontWeight: TSizes.black,
                  ),
                  SizedBox(height: TSizes.defaultSpace),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: commonTextFormField(
                          labelText: "Day*",
                          validator: validateDay,
                          controller: signupmodel.daycontroller,
                          textStyle: TextStyle(color: Colors.black),
                          readOnly: true,
                          onTap: () {
                            signupmodel.pickday(context);
                          },
                          hintText: "Enter the day",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              TSizes.buttonRadius,
                            ),
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                      SizedBox(width: TSizes.spaceSmall),
                      SizedBox(
                        width: 120,
                        child: commonTextFormField(
                          labelText: "Month*",
                          validator: validateMonth,
                          readOnly: true,
                          controller: signupmodel.monthcontroller,
                          onTap: () {
                            signupmodel.pickmonth(context);
                          },
                          textStyle: TextStyle(color: Colors.black),
                          hintText: "Enter the month",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              TSizes.buttonRadius,
                            ),
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                      SizedBox(width: TSizes.spaceSmall),
                      SizedBox(
                        width: 120,
                        child: commonTextFormField(
                          labelText: "Year*",
                          validator: validateYear,
                          controller: signupmodel.yearcontroller,
                          onTap: () {
                            signupmodel.pickyear(context);
                          },
                          readOnly: true,
                          textStyle: TextStyle(color: Colors.black),
                          hintText: "Enter the year",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              TSizes.buttonRadius,
                            ),
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwInputFields),
                  SizedBox(
                    width: TSizes.buttonWidth,
                    child: commonButton(
                      text: 'Continue',
                      textColor: Colors.white,
                      onPressed: () async {
                        final isValid = await signupmodel.validateall(
                          context,
                          _formKey,
                        );
                        if (isValid) {
                          signupmodel.verifyOtpAndSignUp(context);
                        }
                      },
                      backgroundColor: Color(0xFF130329),
                    ),
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
