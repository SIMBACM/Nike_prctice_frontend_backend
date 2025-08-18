import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textfieldwidgets.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<Dasboardprovider>();
      provider.loadCart();
      provider.paymentmethod('UPI');
      provider.selectionUpiMethod('Paypal');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dasboardprovider>(
      builder: (context, paymentmodel, child) => Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          title: commonText(
            text: 'Order Summary',
            fontSize: TSizes.fontSizeMd,
            fontWeight: TSizes.regular,
          ),
        ),
        body: paymentmodel.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: paymentmodel.cart.length,
                      itemBuilder: (context, index) {
                        final item = paymentmodel.cart[index];
                        return Container(
                          padding: EdgeInsets.only(left: 25, right: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText(
                                text: item.title,
                                color: AppColors.greyBackground,
                                fontSize: TSizes.fontSizeMd,
                                fontWeight: TSizes.regular,
                              ),
                              SizedBox(height: TSizes.spaceSmall),
                              commonText(
                                text: item.category,
                                color: AppColors.greyBackground,
                              ),
                              SizedBox(height: TSizes.spaceMedium),
                            ],
                          ),
                        );
                      },
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 25, right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonText(
                                text: 'Subtotal',
                                fontSize: TSizes.fontSizeMd,
                                color: AppColors.greyBackground,
                              ),
                              commonText(
                                text: '₹ Subtotal',
                                fontSize: TSizes.fontSizeMd,
                                color: AppColors.greyBackground,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: TSizes.defaultSpace),
                        Container(
                          padding: EdgeInsets.only(left: 25, right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonText(
                                text: 'Delivery',
                                fontSize: TSizes.fontSizeMd,
                                color: AppColors.greyBackground,
                              ),
                              commonText(
                                text: '₹ Delivery',
                                fontSize: TSizes.fontSizeMd,
                                color: AppColors.greyBackground,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: TSizes.defaultSpace),
                        Container(
                          padding: EdgeInsets.only(left: 25, right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonText(
                                text: 'Total',
                                fontSize: TSizes.fontSizeMd,
                                color: AppColors.greyBackground,
                              ),
                              commonText(
                                text: '₹ Total',
                                fontSize: TSizes.fontSizeMd,
                                color: AppColors.greyBackground,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwSections),
                        Container(
                          padding: EdgeInsets.only(left: 25, right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              reusableCard(
                                width: 80,
                                height: 118,
                                onTap: () {
                                  paymentmodel.paymentmethod('UPI');
                                },
                                backgroundColor:
                                    paymentmodel.selectedPaymentMethod == 'UPI'
                                    ? AppColors.deepPurpleDark
                                    : AppColors.secondary,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/UPI-Logo-vector.svg/2560px-UPI-Logo-vector.svg.png',
                                        width: 40,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(height: TSizes.spaceSmall),
                                      commonText(
                                        text: 'UPI',
                                        fontSize: TSizes.fontSizeMd,
                                        fontWeight: TSizes.regular,
                                        color: AppColors.greyBackground,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              reusableCard(
                                width: 80,
                                height: 118,
                                onTap: () {
                                  paymentmodel.paymentmethod('Card');
                                },
                                backgroundColor:
                                    paymentmodel.selectedPaymentMethod == 'Card'
                                    ? AppColors.deepPurpleDark
                                    : AppColors.secondary,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        LucideIcons.creditCard,
                                        color: AppColors.greyBackground,
                                      ),
                                      SizedBox(height: TSizes.spaceSmall),
                                      commonText(
                                        text: 'Card',
                                        fontSize: TSizes.fontSizeMd,
                                        fontWeight: TSizes.regular,
                                        color: AppColors.greyBackground,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              reusableCard(
                                width: 80,
                                height: 118,
                                onTap: () {
                                  paymentmodel.paymentmethod('Bank');
                                },
                                backgroundColor:
                                    paymentmodel.selectedPaymentMethod == 'Bank'
                                    ? AppColors.deepPurpleDark
                                    : AppColors.secondary,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        LucideIcons.landmark,
                                        color: AppColors.greyBackground,
                                      ),
                                      SizedBox(height: TSizes.spaceSmall),
                                      commonText(
                                        text: 'Bank',
                                        fontSize: TSizes.fontSizeMd,
                                        fontWeight: TSizes.regular,
                                        color: AppColors.greyBackground,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              reusableCard(
                                width: 80,
                                height: 118,
                                onTap: () {
                                  paymentmodel.paymentmethod('Cash');
                                },
                                backgroundColor:
                                    paymentmodel.selectedPaymentMethod == 'Cash'
                                    ? AppColors.deepPurpleDark
                                    : AppColors.secondary,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        LucideIcons.wallet,
                                        color: AppColors.greyBackground,
                                      ),
                                      SizedBox(height: TSizes.spaceSmall),
                                      commonText(
                                        text: 'Cash',
                                        fontSize: TSizes.fontSizeMd,
                                        fontWeight: TSizes.regular,
                                        color: AppColors.greyBackground,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (paymentmodel.selectedPaymentMethod == 'UPI') ...[
                          SizedBox(height: TSizes.defaultSpace),
                          Container(
                            width: 360,
                            height: 320,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0x1A7C7C7C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: TSizes.spaceMedium),
                                upiOption(
                                  name: 'Paypal',
                                  imageUrl: Images.paypal,
                                  activeColor: AppColors.deepPurpleDark,
                                  groupValue: paymentmodel.selectedUPIname,
                                  onChanged: (value) {
                                    paymentmodel.selectionUpiMethod(
                                      value ?? '',
                                    );
                                  },
                                ),
                                upiOption(
                                  name: "Paytm",
                                  imageUrl: Images.paytm,
                                  activeColor: AppColors.deepPurpleDark,
                                  groupValue: paymentmodel.selectedUPIname,
                                  onChanged: (value) {
                                    paymentmodel.selectionUpiMethod(
                                      value ?? '',
                                    );
                                  },
                                ),
                                upiOption(
                                  name: "Gpay",
                                  imageUrl: Images.googlepay,
                                  activeColor: AppColors.deepPurpleDark,
                                  groupValue: paymentmodel.selectedUPIname,
                                  onChanged: (value) {
                                    paymentmodel.selectionUpiMethod(
                                      value ?? '',
                                    );
                                  },
                                ),
                                upiOption(
                                  name: "PhonePe",
                                  imageUrl: Images.phonepay,
                                  activeColor: AppColors.deepPurpleDark,
                                  groupValue: paymentmodel.selectedUPIname,
                                  onChanged: (value) {
                                    paymentmodel.selectionUpiMethod(
                                      value ?? '',
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ] else if (paymentmodel.selectedPaymentMethod ==
                            'Card') ...[
                          SizedBox(height: TSizes.defaultSpace),
                          Container(
                            width: 360,
                            height: 270,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0x1A7C7C7C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonText(
                                  text: 'Card number',
                                  fontSize: TSizes.fontSizeMd,
                                ),
                                commonTextFormField(
                                  labelText: 'xxxx xxxx xxxx xxxx',
                                  hintText: 'xxxx xxxx xxxx xxxx',
                                  suffixIcon: Icon(LucideIcons.creditCard),
                                ),
                                SizedBox(height: TSizes.spaceBtwInputFields),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                          ),
                                          child: commonText(text: 'Valid Thru'),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 95,
                                            right: 10,
                                          ),
                                          child: commonText(text: 'Cvv'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 40,
                                          child: commonTextFormField(
                                            labelText: 'MM/YY',
                                            hintText: 'MM/YY',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          height: 40,
                                          child: commonTextFormField(
                                            labelText: 'CVV',
                                            hintText: 'CVV',
                                            suffixIcon: Icon(
                                              LucideIcons.badgeQuestionMark,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    commonButton(
                                      width: 350,
                                      backgroundColor: AppColors.primary,
                                      text: 'Done',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ] else if (paymentmodel.selectedPaymentMethod ==
                            'Bank') ...[
                          SizedBox(height: TSizes.defaultSpace),
                          Container(
                            width: 360,
                            height: 320,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0x1A7C7C7C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                upiOption(
                                  name: "HDFC",
                                  imageUrl: Images.phonepay,
                                  activeColor: AppColors.deepPurpleDark,
                                  groupValue: paymentmodel.selectedUPIname,
                                  onChanged: (value) {
                                    paymentmodel.selectionUpiMethod(
                                      value ?? '',
                                    );
                                  },
                                ),
                                upiOption(
                                  name: "State Bank Of India",
                                  imageUrl: Images.paytm,
                                  activeColor: AppColors.deepPurpleDark,
                                  groupValue: paymentmodel.selectedUPIname,
                                  onChanged: (value) {
                                    paymentmodel.selectionUpiMethod(
                                      value ?? '',
                                    );
                                  },
                                ),
                                upiOption(
                                  name: "ICICI",
                                  imageUrl: Images.googlepay,
                                  activeColor: AppColors.deepPurpleDark,
                                  groupValue: paymentmodel.selectedUPIname,
                                  onChanged: (value) {
                                    paymentmodel.selectionUpiMethod(
                                      value ?? '',
                                    );
                                  },
                                ),
                                commonTextButton(
                                  onPressed: () {},
                                  text: "All Other Banks",
                                  fontSize: TSizes.fontSizeMd,
                                  textColor: AppColors.primary,
                                  underline: true,
                                  underlineColor: AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ] else if (paymentmodel.selectedPaymentMethod ==
                            'Cash') ...[
                          SizedBox(height: TSizes.defaultSpace),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 30),
                            child: Card(
                              color: Color.fromARGB(26, 238, 230, 230),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: paymentmodel.cart.length,
                                      itemBuilder: (context, index) {
                                        final item = paymentmodel.cart[index];
                                        return Container(
                                          padding: EdgeInsets.only(
                                            left: 25,
                                            right: 35,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              commonText(
                                                text: item.title,
                                                color: AppColors.greyBackground,
                                                fontSize: TSizes.fontSizeMd,
                                                fontWeight: TSizes.regular,
                                              ),
                                              SizedBox(
                                                height: TSizes.spaceSmall,
                                              ),
                                              commonText(
                                                text: item.category,
                                                color: AppColors.greyBackground,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: TSizes.defaultSpace),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 25,
                                        right: 35,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          commonText(
                                            text: 'Subtotal',
                                            fontSize: TSizes.fontSizeMd,
                                            color: AppColors.greyBackground,
                                          ),
                                          commonText(
                                            text: '₹ Subtotal',
                                            fontSize: TSizes.fontSizeMd,
                                            color: AppColors.greyBackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: TSizes.spaceSmall),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 25,
                                        right: 35,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          commonText(
                                            text: 'Delivery',
                                            fontSize: TSizes.fontSizeMd,
                                            color: AppColors.greyBackground,
                                          ),
                                          commonText(
                                            text: '₹ Delivery',
                                            fontSize: TSizes.fontSizeMd,
                                            color: AppColors.greyBackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: TSizes.spaceSmall),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 25,
                                        right: 35,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          commonText(
                                            text: 'Total',
                                            fontSize: TSizes.fontSizeMd,
                                            color: AppColors.greyBackground,
                                          ),
                                          commonText(
                                            text: '₹ Total',
                                            fontSize: TSizes.fontSizeMd,
                                            color: AppColors.greyBackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: TSizes.defaultSpace),
                                    commonButton(
                                      width: 300,
                                      backgroundColor: AppColors.primary,
                                      text: 'Done',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: TSizes.defaultSpace),
                        commonButton(
                          width: 390,
                          height: 50,
                          backgroundColor: AppColors.primary,
                          text: 'Place Order',
                        ),
                        SizedBox(height: 300),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
