import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Bagpage extends StatefulWidget {
  final String? userId;
  const Bagpage({super.key, this.userId});

  @override
  State<Bagpage> createState() => _BagpageState();
}

class _BagpageState extends State<Bagpage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Dasboardprovider>().loadCart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dasboardprovider>(
      builder: (context, cartmodel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: commonText(
            text: 'Bag',
            fontSize: TSizes.fontSizeLg,
            fontWeight: TSizes.bold,
          ),
        ),
        backgroundColor: AppColors.secondary,
        body: cartmodel.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: cartmodel.cart.length,
                        itemBuilder: (context, index) {
                          final item = cartmodel.cart[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: AppColors.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              9,
                                            ),
                                            child: Image.network(
                                              item.thumbnail,
                                              width: 126,
                                              height: 145,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: TSizes.spaceMedium),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              commonText(
                                                text: item.title,
                                                fontSize: TSizes.fontSizeMd,
                                                fontWeight: TSizes.medium,
                                                color: AppColors.backgroundDark,
                                              ),
                                              SizedBox(
                                                height: TSizes.spaceSmall,
                                              ),
                                              commonText(
                                                text: item.category,
                                                fontSize: TSizes.fontSizeSm,
                                                fontWeight: TSizes.medium,
                                                color: AppColors.backgroundDark,
                                              ),
                                              SizedBox(
                                                height: TSizes.spaceSmall,
                                              ),
                                              commonText(
                                                text: item.tags?.join('') ?? "",
                                                fontSize: TSizes.fontSizeSm,
                                                fontWeight: TSizes.medium,
                                                color: AppColors.backgroundDark,
                                              ),
                                              SizedBox(
                                                height: TSizes.spaceSmall,
                                              ),
                                              commonText(
                                                text:
                                                    'Size UK :${item.size.toString()}',
                                                fontSize: TSizes.fontSizeSm,
                                                fontWeight: TSizes.medium,
                                                color: AppColors.backgroundDark,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: TSizes.defaultSpace),
                              counterWidget(
                                onDelete: () {
                                  cartmodel.decrement(index);
                                },
                                onIncrement: () {
                                  cartmodel.increment(index);
                                  cartmodel.sendValuesToUpdateCart(
                                    context,
                                    widget.userId.toString(),
                                  );
                                },
                                count: cartmodel.cart[index].quantity,
                              ),
                              SizedBox(height: TSizes.defaultSpace),
                              Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonText(
                                      text:
                                          "MRP: ${(cartmodel.cart[index].price)}",
                                      fontSize: TSizes.fontSizeMd,
                                      fontWeight: TSizes.medium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: TSizes.defaultSpace),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: [
                                    commonText(
                                      text:
                                          'Incl. of all taxes\n(Also Includes all applicable duties...',
                                      fontSize: TSizes.fontSizeMd,
                                      fontWeight: TSizes.regular,
                                      color: AppColors.greyBackground,
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: TSizes.defaultSpace),
                              Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonText(text: 'Subtotal'),
                            commonText(text: '₹ Subtotal'),
                          ],
                        ),
                        SizedBox(height: TSizes.defaultSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonText(text: 'Delivery'),
                            commonText(text: '₹ Delivery'),
                          ],
                        ),
                        SizedBox(height: TSizes.defaultSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonText(text: 'Total'),
                            commonText(text: '₹ Total'),
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  commonButton(
                    text: 'Checkout',
                    fontSize: TSizes.fontSizeMd,
                    textColor: AppColors.secondary,
                    backgroundColor: AppColors.backgroundDark,
                    width: 336,
                    onPressed: () {
                      // cartmodel.sendValuesToUpdateCart(context);
                    },
                  ),
                  SizedBox(height: 100),
                ],
              ),
      ),
    );
  }
}
