import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';
import 'package:nike_prctice/Pages/Home/view/fulldetails.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/sliderwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Productdetailspage extends StatelessWidget {
  final Welcome product;
  const Productdetailspage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<Dasboardprovider>(
      builder: (context, productpagemodel, child) => Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(title: Text(product.title)),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: productImageSliderCard(
                  imageUrls: product.images,
                  onAddToCart: () {
                    productpagemodel.sendvaluestocartapi(
                      context,
                      product.title,
                      product.category,
                      product.price.toString(),
                      product.thumbnail,
                      product.tags?.join(',') ?? '',
                      productpagemodel.selectedsize ?? '',
                      1,
                    );
                  },
                  onShare: () {
                    final productUrl =
                        "https://nike.com/product/${product.title}";
                    productpagemodel.shareProduct(
                      context,
                      productUrl,
                      product.thumbnail,
                    );
                  },

                  height: 300,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(
                      text: product.title,
                      fontSize: TSizes.fontSizeLg,
                      fontWeight: TSizes.black,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonText(
                      text: product.category,
                      fontSize: TSizes.fontSizeLg,
                      fontWeight: TSizes.regular,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonText(
                      text: "MRP:${product.price.toString()}",
                      fontSize: TSizes.fontSizeMd,
                      fontWeight: TSizes.semiBold,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonText(
                      text:
                          "Inclusive of all taxes\n( also includes all applicable duties )",
                      fontSize: TSizes.fontSizeLg,
                      color: AppColors.grey,
                      fontWeight: TSizes.regular,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonText(
                      text: 'Size - UK',
                      fontSize: TSizes.fontSizeMd,
                      fontWeight: TSizes.semiBold,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          commonButton(
                            text: '6',
                            isCircular: true,
                            textColor: productpagemodel.issizeseleted('6')
                                ? AppColors.secondary
                                : AppColors.backgroundDark,
                            backgroundColor: productpagemodel.issizeseleted('6')
                                ? AppColors.backgroundDark
                                : AppColors.secondary,
                            onPressed: () {
                              productpagemodel.size('6');
                            },
                          ),
                          commonButton(
                            text: '7',
                            isCircular: true,
                            textColor: productpagemodel.issizeseleted('7')
                                ? AppColors.secondary
                                : AppColors.backgroundDark,
                            backgroundColor: productpagemodel.issizeseleted('7')
                                ? AppColors.backgroundDark
                                : AppColors.secondary,
                            onPressed: () {
                              productpagemodel.size('7');
                            },
                          ),
                          commonButton(
                            text: '8',
                            isCircular: true,
                            textColor: productpagemodel.issizeseleted('8')
                                ? AppColors.secondary
                                : AppColors.backgroundDark,
                            backgroundColor: productpagemodel.issizeseleted('8')
                                ? AppColors.backgroundDark
                                : AppColors.secondary,
                            onPressed: () {
                              productpagemodel.size('8');
                            },
                          ),
                          commonButton(
                            text: '9',
                            isCircular: true,
                            textColor: productpagemodel.issizeseleted('9')
                                ? AppColors.secondary
                                : AppColors.backgroundDark,
                            backgroundColor: productpagemodel.issizeseleted('9')
                                ? AppColors.backgroundDark
                                : AppColors.secondary,
                            onPressed: () {
                              productpagemodel.size('9');
                            },
                          ),
                          commonButton(
                            text: '10',
                            isCircular: true,
                            textColor: productpagemodel.issizeseleted('10')
                                ? AppColors.secondary
                                : AppColors.backgroundDark,
                            backgroundColor:
                                productpagemodel.issizeseleted('10')
                                ? AppColors.backgroundDark
                                : AppColors.secondary,
                            onPressed: () {
                              productpagemodel.size('10');
                            },
                          ),
                          commonButton(
                            text: '11',
                            isCircular: true,
                            textColor: productpagemodel.issizeseleted('11')
                                ? AppColors.secondary
                                : AppColors.backgroundDark,
                            backgroundColor:
                                productpagemodel.issizeseleted('11')
                                ? AppColors.backgroundDark
                                : AppColors.secondary,
                            onPressed: () {
                              productpagemodel.size('11');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonText(
                      text: product.description.toString(),
                      fontSize: TSizes.fontSizeLg,
                      fontWeight: TSizes.light,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonText(
                      text: "• Tag: ${product.tags?.join('/') ?? ''}",
                      fontSize: TSizes.fontSizeMd,
                    ),
                    SizedBox(height: TSizes.spaceSmall),
                    commonText(
                      text: "• Brand: ${product.brand.toString()}",
                      fontSize: TSizes.fontSizeMd,
                    ),
                    SizedBox(height: TSizes.spaceSmall),
                    commonText(
                      text: "• Stock: ${product.stock.toString()}",
                      fontSize: TSizes.fontSizeMd,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonCard(
                      width: 390,
                      height: 90,
                      title: "Product Information",
                      fontSize: TSizes.fontSizeMd,
                      borderRadius: BorderRadius.circular(20),
                      alignment: Alignment.centerLeft,
                      textColor: AppColors.primary,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonCard(
                      width: 390,
                      height: 90,
                      title: "Review: ${product.rating}/5",
                      fontSize: TSizes.fontSizeMd,
                      borderRadius: BorderRadius.circular(20),
                      alignment: Alignment.centerLeft,
                      textColor: AppColors.primary,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonTextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Fulldetails(product: product),
                          ),
                        );
                      },
                      text: 'View Product Details',
                      fontSize: TSizes.fontSizeMd,
                      textColor: AppColors.primary,
                      underline: true,
                      underlineColor: AppColors.primary,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonText(
                      text: 'You Might Also Like',
                      fontSize: TSizes.fontSizeLg,
                      fontWeight: TSizes.black,
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    productpagemodel.isLoading
                        ? CircularProgressIndicator()
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: productpagemodel.products.map((
                                product,
                              ) {
                                return productCard(
                                  imageUrl: product.thumbnail,
                                  title: product.title,
                                  subtitle: product.category,
                                  price: product.price.toString(),
                                  isFavorite: product.isFavorite,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => Productdetailspage(
                                          product: product,
                                        ),
                                      ),
                                    );
                                  },
                                  onPressed: () {
                                    productpagemodel.toggleFavoriteStatus(
                                      product,
                                    );
                                    productpagemodel.sendvaluestofavapi(
                                      context,
                                      product.title,
                                      product.category,
                                      product.price.toString(),
                                      product.thumbnail,
                                      product.isFavorite,
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                    SizedBox(height: TSizes.defaultSpace),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonButton(
                          text: "Add to Bag",
                          fontSize: TSizes.fontSizeMd,
                          textColor: AppColors.secondary,
                          width: 150,
                          backgroundColor: AppColors.backgroundDark,
                        ),
                        commonButton(
                          text: "Buy",
                          fontSize: TSizes.fontSizeMd,
                          textColor: AppColors.primary,
                          width: 150,
                          backgroundColor: AppColors.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
