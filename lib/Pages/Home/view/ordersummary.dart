import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/Pages/Home/view/payment.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/utils/commonutils.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/commondropdown.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Ordersummary extends StatefulWidget {
  const Ordersummary({super.key});

  @override
  State<Ordersummary> createState() => _OrdersummaryState();
}

class _OrdersummaryState extends State<Ordersummary> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<Dasboardprovider>();
      provider.loadCart();
      provider.loadAddress();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dasboardprovider>(
      builder: (context, ordermodel, child) => Scaffold(
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
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      imagePath: Images.ordersummary,
                      width: 96,
                      height: 47,
                      onTap: () {
                        NavigationUtil.push(context, Ordersummary());
                      },
                      fit: BoxFit.contain,
                    ),
                    tappableImage(
                      imagePath: Images.payment,
                      width: 54,
                      height: 47,
                      onTap: () {},
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: TSizes.defaultSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonText(
                            text: 'Delivery to:',
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: TSizes.regular,
                            color: AppColors.backgroundDark,
                          ),
                          Icon(Icons.create, size: 18),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 35),
                      child: Row(
                        children: [
                          commonText(
                            text: ordermodel.address.isNotEmpty
                                ? ordermodel.address[0].fullname
                                : 'no full name found',
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: TSizes.regular,
                            color: AppColors.greyBackground,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonButton(
                            text: ordermodel.address.isNotEmpty
                                ? ordermodel.address[0].addresstype
                                : 'No type found',
                            width: 130,
                            backgroundColor: AppColors.greyBackground,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 35),
                      child: commonText(
                        text: ordermodel.address.isNotEmpty
                            ? '${ordermodel.address[0].housenumber}, ${ordermodel.address[0].area}, ${ordermodel.address[0].city}, ${ordermodel.address[0].state}, ${ordermodel.address[0].pincode}'
                            : 'No address found',

                        fontSize: TSizes.fontSizeMd,
                        fontWeight: TSizes.regular,
                        color: AppColors.greyBackground,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.defaultSpace),
                ordermodel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: ordermodel.cart.length,
                              itemBuilder: (context, index) {
                                final item = ordermodel.cart[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      color: AppColors
                                          .secondary, // white background
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ), // match the image radius
                                      ),
                                      child: SizedBox(
                                        width: double
                                            .infinity, // full width, or set exact value
                                        height: 200, // match the image height
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  child: Image.network(
                                                    item.thumbnail,
                                                    width: 126,
                                                    height: 145,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: TSizes.spaceMedium,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    commonText(
                                                      text: item.title,
                                                      fontSize:
                                                          TSizes.fontSizeMd,
                                                      fontWeight: TSizes.medium,
                                                      color: AppColors
                                                          .backgroundDark,
                                                    ),
                                                    SizedBox(
                                                      height: TSizes.spaceSmall,
                                                    ),
                                                    commonText(
                                                      text: item.category,
                                                      fontSize:
                                                          TSizes.fontSizeSm,
                                                      fontWeight: TSizes.medium,
                                                      color: AppColors
                                                          .backgroundDark,
                                                    ),
                                                    SizedBox(
                                                      height: TSizes.spaceSmall,
                                                    ),
                                                    commonText(
                                                      text:
                                                          item.tags?.join('') ??
                                                          "",
                                                      fontSize:
                                                          TSizes.fontSizeSm,
                                                      fontWeight: TSizes.medium,
                                                      color: AppColors
                                                          .backgroundDark,
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
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 25,
                                        right: 35,
                                      ),
                                      child: customQtyDropdown(
                                        label: 'Qty',
                                        items: ordermodel.quantity,
                                        selectedValue: ordermodel
                                            .cart[index]
                                            .selectedQty
                                            .toString(),
                                        onChanged: (value) {
                                          ordermodel.updateQty(index, value!);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: TSizes.defaultSpace),
                          Container(
                            padding: EdgeInsets.only(left: 25, right: 35),
                            child: commonText(text: 'Price details'),
                          ),
                          SizedBox(height: TSizes.defaultSpace),
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
                                  text:
                                      '₹ ${ordermodel.getsubtotal().toStringAsFixed(2)}',
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
                                  text:
                                      '₹ ${ordermodel.getDelivery().toString()}',
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
                                  color: AppColors.backgroundDark,
                                ),
                                commonText(
                                  text: '₹ ${ordermodel.gettotal().toString()}',
                                  fontSize: TSizes.fontSizeMd,
                                  color: AppColors.backgroundDark,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: TSizes.defaultSpace),
                          commonButton(
                            text: 'Continue',
                            fontSize: TSizes.fontSizeMd,
                            textColor: AppColors.secondary,
                            backgroundColor: AppColors.primary,
                            width: 336,
                            onPressed: () {
                              NavigationUtil.push(context, Payment());
                            },
                          ),
                          SizedBox(height: 100),
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
