import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/authprovider.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/Pages/Home/view/payment.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/utils/commonutils.dart';
import 'package:nike_prctice/validations/validation.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textfieldwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Addresspage extends StatelessWidget {
  const Addresspage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Consumer2<Dasboardprovider, Authprovider>(
      builder: (context, addressmodel, authadressmodel, _) => Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: commonText(
              text: 'Address',
              fontSize: TSizes.fontSizeMd,
              fontWeight: TSizes.regular,
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: TSizes.spaceMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tappableImage(
                      imagePath: Images.address,
                      width: 59,
                      height: 47,
                      onTap: () {},
                      fit: BoxFit.contain,
                    ),
                    tappableImage(
                      imagePath: Images.payment,
                      width: 54,
                      height: 47,
                      onTap: () {
                        NavigationUtil.push(context, Payment());
                      },
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: TSizes.defaultSpace),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      commonTextFormField(
                        labelText: "Full Name (Required)*",
                        hintText: 'Full Name (Required)*',
                        controller: addressmodel.fullname,
                        validator: validateFullName,
                      ),
                      SizedBox(height: TSizes.spaceBtwInputFields),
                      commonTextFormField(
                        labelText: "Phone number (Required)*",
                        hintText: 'Phone number (Required)*',
                        controller: addressmodel.phonenumber,
                        validator: validatePhoneNumber,
                      ),
                      SizedBox(height: TSizes.spaceBtwInputFields),
                      commonTextFormField(
                        labelText: "Alternate phone number",
                        hintText: 'Alternate phone number',
                        controller: addressmodel.alternatephnonenumber,
                      ),
                      SizedBox(height: TSizes.spaceBtwInputFields),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 175,
                              child: commonTextFormField(
                                labelText: "Pincode (Required)*",
                                hintText: 'Pincode (Required)*',
                                controller: addressmodel.pincode,
                                validator: validatePincode,
                              ),
                            ),
                            SizedBox(width: TSizes.defaultSpace),
                            SizedBox(
                              width: 175,
                              child: commonTextFormField(
                                labelText: "State (Required)*",
                                hintText: 'State (Required)*',
                                controller: addressmodel.state,
                                validator: validateState,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtwInputFields),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 175,
                              child: commonTextFormField(
                                labelText: "City (Required)*",
                                hintText: 'City (Required)*',
                                controller: addressmodel.city,
                                validator: validateCity,
                              ),
                            ),
                            SizedBox(width: TSizes.defaultSpace),
                            SizedBox(
                              width: 175,
                              child: commonTextFormField(
                                labelText: "Landmark(Required)*",
                                hintText: 'Landmark(Required)*',
                                controller: addressmodel.landmark,
                                validator: validateLandmark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtwInputFields),
                      commonTextFormField(
                        labelText: "House No., Building Name (Required)*",
                        hintText: 'House No., Building Name (Required)*',
                        controller: addressmodel.houseno,
                        validator: validateHouseNumber,
                      ),
                      SizedBox(height: TSizes.spaceBtwInputFields),
                      commonTextFormField(
                        labelText: "Road name, Area, Colony (Required)*",
                        hintText: 'Road name, Area, Colony (Required)*',
                        controller: addressmodel.area,
                        validator: validateRoadAreaColony,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      commonText(
                        text: 'Type of address',
                        fontSize: TSizes.fontSizeSm,
                        fontWeight: TSizes.regular,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: commonButton(
                          prefixIcon: Icon(Icons.home),
                          text: 'Home',
                          textColor: AppColors.primary,
                          backgroundColor: addressmodel.isSelected('Home')
                              ? AppColors.grey
                              : AppColors.secondary,
                          onPressed: () {
                            addressmodel.location('Home');
                          },
                        ),
                      ),
                      SizedBox(width: TSizes.defaultSpace),
                      SizedBox(
                        width: 120,
                        child: commonButton(
                          prefixIcon: Icon(Icons.apartment),
                          text: 'Work',
                          textColor: AppColors.primary,
                          backgroundColor: addressmodel.isSelected('Work')
                              ? AppColors.grey
                              : AppColors.secondary,
                          onPressed: () {
                            addressmodel.location('Work');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Container(
                  alignment: Alignment.center,
                  child: commonButton(
                    text: 'Save',
                    width: 300,
                    backgroundColor: AppColors.primary,
                    onPressed: () async {
                      final isValid = await authadressmodel.validateall(
                        context,
                        _formKey,
                      );
                      if (isValid) {
                        addressmodel.sendvaluestostoreaddress(context);
                      }
                    },
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
