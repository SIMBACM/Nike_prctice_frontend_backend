import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/commondropdown.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Bagpage extends StatefulWidget {
  const Bagpage({super.key});

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
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 155,
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(9),
                                        child: Image.network(
                                          item.thumbnail,
                                          width: 126,
                                          height: 145,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: TSizes.spaceMedium),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            commonText(
                                              text: item.title,
                                              fontSize: TSizes.fontSizeMd,
                                              fontWeight: TSizes.medium,
                                            ),
                                            SizedBox(
                                              height: TSizes.defaultSpace,
                                            ),
                                            commonText(
                                              text: item.category,
                                              fontSize: TSizes.fontSizeMd,
                                              fontWeight: TSizes.medium,
                                              color: AppColors.grey,
                                            ),
                                            SizedBox(
                                              height: TSizes.defaultSpace,
                                            ),
                                            commonText(
                                              text: item.tags?.join('') ?? "",
                                              fontSize: TSizes.fontSizeMd,
                                              fontWeight: TSizes.medium,
                                              color: AppColors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: TSizes.defaultSpace),
                              customQtyDropdown(
                                label: 'Qty',
                                items: cartmodel.quantity,
                                selectedValue: cartmodel.cart[index].selectedQty
                                    .toString(),
                                onChanged: (value) {
                                  cartmodel.updateQty(index, value);
                                },
                              ),
                              SizedBox(height: TSizes.defaultSpace),
                              Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonText(
                                      text: "MRP: ${item.price.toString()}",
                                      fontSize: TSizes.fontSizeMd,
                                      fontWeight: TSizes.medium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: TSizes.defaultSpace),
                              Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                alignment: Alignment.centerRight,
                                child: commonText(
                                  text:
                                      'Incl. of all taxes\nAlso Includes all applicable duti..',
                                  fontSize: TSizes.fontSizeMd,
                                  fontWeight: TSizes.regular,
                                ),
                              ),
                              Divider(),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      commonText(text: 'Subtotal'),
                                      commonText(text: '₹ 23,795.00'),
                                    ],
                                  ),
                                  SizedBox(height: TSizes.defaultSpace),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      commonText(text: 'Delivery'),
                                      commonText(text: '₹ 1,250.00'),
                                    ],
                                  ),
                                  SizedBox(height: TSizes.defaultSpace),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      commonText(text: 'Total'),
                                      commonText(text: '₹ 25,045.00'),
                                    ],
                                  ),
                                  SizedBox(height: TSizes.defaultSpace),
                                  commonButton(
                                    text: 'Remove',
                                    fontSize: TSizes.fontSizeMd,
                                    textColor: AppColors.secondary,
                                    backgroundColor: AppColors.primary,
                                    width: 200,
                                    onPressed: () {
                                      cartmodel.sendvaluestodeletecartapi(
                                        item.id!,
                                        context,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 50),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  commonButton(
                    text: 'Checkout',
                    fontSize: TSizes.fontSizeMd,
                    textColor: AppColors.secondary,
                    backgroundColor: AppColors.primary,
                    width: 336,
                    onPressed: () {},
                  ),
                  SizedBox(height: 100),
                ],
              ),
      ),
    );
  }
}
