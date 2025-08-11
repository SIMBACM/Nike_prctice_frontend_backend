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
      context.read<Dasboardprovider>().loadCart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dasboardprovider>(
      builder: (context, ordermodel, child) => Scaffold(
        appBar: AppBar(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row: "Delivery to:" + edit icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery to:"),
                          Icon(Icons.edit, size: 18),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Name + Home badge
                      Row(
                        children: [
                          Text("John Smith"),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.home, size: 14, color: Colors.white),
                                const SizedBox(width: 4),
                                Text(
                                  "Home",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Address text
                      Text(
                        "Quisque fermentum ipsum vitae diam sagittis malesuada. "
                        "Ut rutrum venenatis sem, non molestie leo vehicula a.",
                      ),
                    ],
                  ),
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
                                      child: Container(
                                        width: MediaQuery.of(
                                          context,
                                        ).size.width,
                                        height: 155,
                                        padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondary,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
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
                                                    fontSize: TSizes.fontSizeMd,
                                                    fontWeight: TSizes.medium,
                                                  ),
                                                  SizedBox(
                                                    height: TSizes.spaceSmall,
                                                  ),
                                                  commonText(
                                                    text: item.category,
                                                    fontSize: TSizes.fontSizeMd,
                                                    fontWeight: TSizes.medium,
                                                    color: AppColors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: TSizes.spaceSmall,
                                                  ),
                                                  commonText(
                                                    text:
                                                        item.tags?.join('') ??
                                                        "",
                                                    fontSize: TSizes.fontSizeMd,
                                                    fontWeight: TSizes.medium,
                                                    color: AppColors.grey,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: TSizes.defaultSpace),
                                    customQtyDropdown(
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
                                    SizedBox(height: TSizes.defaultSpace),
                                    Column(
                                      children: [
                                        SizedBox(height: TSizes.defaultSpace),
                                        commonButton(
                                          text: 'Remove',
                                          fontSize: TSizes.fontSizeMd,
                                          textColor: AppColors.secondary,
                                          backgroundColor: AppColors.primary,
                                          width: 200,
                                          onPressed: () {
                                            ordermodel
                                                .sendvaluestodeletecartapi(
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
