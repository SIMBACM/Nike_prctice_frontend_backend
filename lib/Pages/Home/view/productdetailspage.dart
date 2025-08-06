import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/Pages/Home/controllers/widgets.dart';
import 'package:nike_prctice/Pages/Home/models/productmodel.dart';
import 'package:nike_prctice/Pages/Home/view/fulldetails.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
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
                  onAddToCart: () => print("Cart clicked"),
                  onShare: () => print("Share clicked"),
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
                      text: "• Brand: ${product.price.toString()}",
                      fontSize: TSizes.fontSizeMd,
                    ),
                    SizedBox(height: TSizes.spaceSmall),
                    commonText(
                      text: "• SKU: ${product.price.toString()}",
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
                            builder: (context) =>
                                Fulldetails(product: product),
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
                    Container(
                      alignment: Alignment.centerRight,
                      child: commonButton(
                        text: "Buy",
                        fontSize: TSizes.fontSizeMd,
                        textColor: AppColors.primary,
                        width: 150,
                        backgroundColor: AppColors.secondary,
                      ),
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
