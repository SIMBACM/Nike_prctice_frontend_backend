import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/Pages/Home/view/productdetailspage.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/utils/commonutils.dart';
import 'package:nike_prctice/widgets/Appbarwidget.dart';
import 'package:nike_prctice/widgets/bottomnavigationbutton.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<Dasboardprovider>(context, listen: false).loadproducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dasboardprovider>(
      builder: (context, shopmodel, child) => Scaffold(
        appBar: CommonHomeAppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: commonText(
                  text: "Shop",
                  fontSize: 20,
                  fontWeight: TSizes.semiBold,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 2, right: 15),
                child: Row(
                  children: [
                    commonTextButton(
                      onPressed: () {
                        shopmodel.loadproducts();
                      },
                      text: 'Men',
                      textColor: Colors.black,
                      fontSize: 16,
                    ),
                    commonTextButton(
                      onPressed: () {
                        shopmodel.loadwomenproducts();
                      },
                      text: 'Women',
                      textColor: Colors.black,
                      fontSize: 16,
                    ),
                    commonTextButton(
                      onPressed: () {
                        shopmodel.loadproducts();
                      },
                      text: 'Kids',
                      textColor: Colors.black,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: commonText(
                  text: 'This Week’s Highlights',
                  fontSize: TSizes.fontSizeLg,
                  fontWeight: TSizes.regular,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  lebronCard(
                    width: 130,
                    height: 190,
                    title: 'New\narrivals',
                    fontsize: TSizes.fontSizeMd,
                    fontWeight: TSizes.regular,
                    assetImagePath: Images.shopimage1,
                  ),
                  lebronCard(
                    width: 130,
                    height: 190,
                    title: 'Just Dropped:\nAlphafly 3',
                    fontWeight: TSizes.regular,
                    fontsize: TSizes.fontSizeMd,
                    assetImagePath: Images.shopimage2,
                  ),
                  lebronCard(
                    width: 130,
                    height: 190,
                    title: 'Nike\nPegasus\npremium',
                    fontsize: TSizes.fontSizeMd,
                    fontWeight: TSizes.regular,
                    assetImagePath: Images.shopimage3,
                  ),
                ],
              ),
              SizedBox(height: TSizes.sm),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  lebronCard(
                    width: 130,
                    height: 190,
                    title: 'Airforce 1',
                    fontsize: TSizes.fontSizeMd,
                    fontWeight: TSizes.regular,
                    assetImagePath: Images.shopimage4,
                  ),
                  lebronCard(
                    width: 130,
                    height: 190,
                    title: 'Tennis',
                    fontWeight: TSizes.regular,
                    fontsize: TSizes.fontSizeMd,
                    assetImagePath: Images.shopimage5,
                  ),
                  lebronCard(
                    width: 130,
                    height: 190,
                    title: 'Shop all',
                    fontsize: TSizes.fontSizeMd,
                    fontWeight: TSizes.regular,
                    assetImagePath: Images.shopimage6,
                  ),
                ],
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    commonCard(
                      assetImagePath: Images.shopimage7,
                      width: 390,
                      height: 130,
                      title: "New & Featured",
                      fontSize: TSizes.fontSizeMd,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonCard(
                      assetImagePath: Images.shopimage8,
                      width: 390,
                      height: 130,
                      title: "Shoes",
                      fontSize: TSizes.fontSizeMd,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonCard(
                      assetImagePath: Images.shopimage9,
                      width: 390,
                      height: 130,
                      title: "Clothing and Accessories",
                      fontSize: TSizes.fontSizeMd,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    commonCard(
                      assetImagePath: Images.shopimage10,
                      width: 390,
                      height: 130,
                      title: "Sales",
                      fontSize: TSizes.fontSizeMd,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 16, right: 15),
                child: commonText(text: "Shop By Icons", fontSize: 20),
              ),
              SizedBox(height: TSizes.defaultSpace),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe5,
                            title: "Dunk",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe3,
                            title: "Airforce",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe1,
                            title: "Air Jordan",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.defaultSpace),
                      Row(
                        children: [
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe6,
                            title: "Running",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe4,
                            title: "Air MAx",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe2,
                            title: "Pegasus",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.defaultSpace),
                      Row(
                        children: [
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe9,
                            title: "Slider and\nScandals",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe8,
                            title: "Metcon",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.shoe7,
                            title: "Blazer",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                      lebronCard(
                        width: 160,
                        height: 200,
                        assetImagePath: Images.shoe10,
                        title: "Nike By You",
                        fontWeight: TSizes.regular,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 16, right: 15),
                child: commonText(text: "Simplify Your Style", fontSize: 20),
              ),
              SizedBox(height: TSizes.defaultSpace),
              shopmodel.isLoading
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: shopmodel.products.map((product) {
                          return productCard(
                            imageUrl: product.thumbnail,
                            title: product.title,
                            price: product.price.toString(),
                            onTap: () {
                              NavigationUtil.push(
                                context,
                                Productdetailspage(product: product),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 16, right: 15),
                child: commonText(text: "Shop By Sport", fontSize: 20),
              ),
              SizedBox(height: TSizes.defaultSpace),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.running,
                            title: "Running",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.tennis,
                            title: "Tennis",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.training,
                            title: "Training",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.defaultSpace),
                      Row(
                        children: [
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.bascketball,
                            title: "Basketball",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.yoga,
                            title: "Yoga",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.dance,
                            title: "Dance",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.defaultSpace),
                      Row(
                        children: [
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.football,
                            title: "Football",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.skateboading,
                            title: "Skateboarding",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 16, right: 15),
                child: commonText(text: "Shop By Color", fontSize: 20),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          lebronCard(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.brown,
                            title: "Brown",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.grey,
                            title: "Grey",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          lebronCard(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.black,
                            title: "Black",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.white,
                            title: "White",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 16, right: 15),
                child: commonText(text: "Our Best Sellers", fontSize: 20),
              ),
              SizedBox(height: TSizes.defaultSpace),
              shopmodel.isLoading
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: shopmodel.products.map((product) {
                          return productCard(
                            imageUrl: product.thumbnail,
                            title: product.title,
                            price: product.price.toString(),
                            onTap: () {
                              NavigationUtil.push(
                                context,
                                Productdetailspage(product: product),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
              SizedBox(height: TSizes.defaultSpace),
              Center(
                child: commonButton(
                  borderRadius: 30,
                  backgroundColor: Colors.white,
                  text: 'View All',
                  textColor: Colors.black,
                  fontSize: 28,
                  width: 150,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 16, right: 15),
                child: commonText(text: "Shop By Brand", fontSize: 20),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          commonCard1(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.nikeofficial,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonCard1(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.nikelab,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonCard1(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.jordan,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.defaultSpace),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          commonCard1(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.nike,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonCard1(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.niketriangle,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonCard1(
                            width: 190,
                            height: 170,
                            assetImagePath: Images.nikebyyou,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: commonText(text: "My Interests", fontSize: 26),
                  ),
                  SizedBox(width: TSizes.spaceLarge),
                  commonTextButton(
                    onPressed: () {},
                    text: 'Add interest',
                    fontSize: TSizes.fontSizeLg,
                    textColor: Colors.grey,
                    underline: true,
                  ),
                ],
              ),
              SizedBox(height: TSizes.defaultSpace),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.running,
                            title: "Running",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.tennis,
                            title: "Tennis",
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          lebronCard(
                            width: 160,
                            height: 200,
                            assetImagePath: Images.training,
                            title: "Training",
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                padding: EdgeInsets.only(left: 16, right: 15),
                child: commonText(text: "Member service", fontSize: 20),
              ),
              SizedBox(height: TSizes.defaultSpace),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          commonCard2(
                            width: 120,
                            height: 150,
                            assetImagePath: Images.ultimate,
                            title: 'The Ultimate\nShopping',
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonCard2(
                            width: 120,
                            height: 150,
                            assetImagePath: Images.checkorder,
                            title: 'Check your\nOrder Status',
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonCard2(
                            width: 120,
                            height: 150,
                            assetImagePath: Images.contactus,
                            title: 'Contact us',
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.defaultSpace),
                      Row(
                        children: [
                          commonCard2(
                            width: 120,
                            height: 150,
                            assetImagePath: Images.explore,
                            title: 'Explore the\nmember\nshop',
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: TSizes.regular,
                          ),
                          SizedBox(width: TSizes.defaultSpace),
                          commonCard2(
                            width: 120,
                            height: 150,
                            assetImagePath: Images.customise,
                            title: 'Customise\nwith Nike By\nYou',
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: TSizes.regular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 300),
            ],
          ),
        ),
        bottomNavigationBar: commonBottomNavigationBar(context, shopmodel),
      ),
    );
  }
}
