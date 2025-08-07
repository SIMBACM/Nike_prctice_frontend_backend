import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/Pages/Home/view/productdetailspage.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/Appbarwidget.dart';
import 'package:nike_prctice/widgets/bottomnavigationbutton.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';
import 'package:provider/provider.dart';

class Maindashboard extends StatefulWidget {
  final String? fetchedusername;
  const Maindashboard({super.key, this.fetchedusername, });

  @override
  State<Maindashboard> createState() => _MaindashboardState();
}

class _MaindashboardState extends State<Maindashboard> {
  bool isNike = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Dasboardprovider>().loadproducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dasboardprovider>(
      builder: (context, dasboadmodel, child) => Scaffold(
        backgroundColor: Colors.white,
        // APP bar
        appBar: CommonHomeAppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: TSizes.defaultSpace),

              // Greeting and username
              Container(
                alignment: Alignment.center,
                child: commonText(
                  text: 'Good Morning ${widget.fetchedusername}',
                  fontSize: 24,
                  fontWeight: TSizes.semiBold,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 60),
                    child: commonText(
                      text: "Top Picks for You",
                      fontSize: 20,
                      fontWeight: TSizes.semiBold,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceLarge),
                  commonTextButton(
                    onPressed: () {},
                    text: 'View all',
                    fontSize: TSizes.fontSizeMd,
                    textColor: Colors.grey,
                    underline: true,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 60),
                child: commonText(
                  text: 'Recommended products',
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: TSizes.regular,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              // Api calling
              dasboadmodel.isLoading
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dasboadmodel.products.map((product) {
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
                                  builder: (_) =>
                                      Productdetailspage(product: product),
                                ),
                              );
                            },
                            onPressed: () {
                              dasboadmodel.toggleFavoriteStatus(product);
                              dasboadmodel.sendvaluestofavapi(
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
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 60),
                    child: commonText(
                      text: 'New From Nike',
                      fontSize: 24,
                      fontWeight: TSizes.semiBold,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceLarge),
                  commonTextButton(
                    onPressed: () {},
                    text: 'View all',
                    fontSize: TSizes.fontSizeMd,
                    textColor: Colors.grey,
                    underline: true,
                  ),
                ],
              ),
              SizedBox(height: TSizes.defaultSpace),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Row(
                    children: [
                      lebronCard(
                        assetImagePath: Images.cover1,
                        title: 'Apply Pressure',
                        fontsize: TSizes.fontSizeMd,
                        fontWeight: TSizes.regular,
                        color: Colors.white,
                        subtitle: "Lebron XXII",
                        subtitlefontweight: TSizes.extraBold,
                        subtitlecolor: Colors.white,
                        subtitlefontSize: 28,
                      ),
                      SizedBox(width: TSizes.defaultSpace),
                      lebronCard(
                        assetImagePath: Images.cover2,
                        title: 'Just In',
                        fontsize: TSizes.fontSizeMd,
                        fontWeight: TSizes.regular,
                        color: Colors.white,
                        subtitle: "KIDS’ LEBRON XXII\n‘TUNNEL VISION’",
                        subtitlefontweight: TSizes.extraBold,
                        subtitlecolor: Colors.white,
                        subtitlefontSize: 28,
                      ),
                      SizedBox(width: TSizes.defaultSpace),
                      lebronCard(
                        assetImagePath: Images.cover4,
                        title: 'IOC Refugee Olympic Team',
                        fontsize: TSizes.fontSizeMd,
                        fontWeight: TSizes.regular,
                        color: Colors.white,
                        subtitle: "WATCH WHERE\nWE’RE GOING",
                        subtitlefontweight: TSizes.extraBold,
                        subtitlecolor: Colors.white,
                        subtitlefontSize: 28,
                      ),
                      SizedBox(width: TSizes.defaultSpace),
                      lebronCard(assetImagePath: Images.cover3),
                    ],
                  ),
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              lebronCard(
                assetImagePath: Images.cover5,
                height: 150,
                width: 300,
                title: 'Apply Pressure',
                fontsize: TSizes.fontSizeMd,
                fontWeight: TSizes.regular,
                color: Colors.white,
                subtitle: "Lebron XXII",
                subtitlefontweight: TSizes.extraBold,
                subtitlecolor: Colors.white,
                subtitlefontSize: 28,
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    commonText(
                      text: 'New From Nike',
                      fontSize: 24,
                      fontWeight: TSizes.semiBold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    dasboadmodel.isLoading
                        ? CircularProgressIndicator()
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: dasboadmodel.products.map((product) {
                                return productCard(
                                  imageUrl: product.thumbnail,
                                  title: product.title,
                                  price: product.price.toString(),
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
                                );
                              }).toList(),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 60),
                child: commonText(
                  text: 'Stories for you',
                  fontSize: 24,
                  fontWeight: TSizes.semiBold,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              lebronCard(
                assetImagePath: Images.stories,
                height: 250,
                width: 390,
                title: 'Buying Guide',
                color: Colors.grey,
                subtitle: 'How to Choose the Best\nNike Soccer Cleats for Kids',
                subtitlecolor: Colors.white,
                fontsize: TSizes.fontSizeLg,
                fontWeight: TSizes.regular,
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
              dasboadmodel.isLoading
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dasboadmodel.products.map((product) {
                          return productCard(
                            imageUrl: product.thumbnail,
                            title: product.title,
                            price: product.price.toString(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      Productdetailspage(product: product),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 60),
                child: commonText(
                  text: "Because you like",
                  fontSize: 20,
                  fontWeight: TSizes.semiBold,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 60),
                child: commonText(
                  text: 'Basket ball',
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: TSizes.regular,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              dasboadmodel.isLoading
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dasboadmodel.products.map((product) {
                          return productCard(
                            imageUrl: product.thumbnail,
                            title: product.title,
                            price: product.price.toString(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      Productdetailspage(product: product),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
              SizedBox(height: TSizes.defaultSpace),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 60),
                child: commonText(
                  text: "Because you like",
                  fontSize: 20,
                  fontWeight: TSizes.semiBold,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 60),
                child: commonText(
                  text: 'Cross training',
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: TSizes.regular,
                ),
              ),
              SizedBox(height: TSizes.spaceLarge),
              dasboadmodel.isLoading
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dasboadmodel.products.map((product) {
                          return productCard(
                            imageUrl: product.thumbnail,
                            title: product.title,
                            price: product.price.toString(),
                            subtitle: product.title,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      Productdetailspage(product: product),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
              SizedBox(height: 30),
              Image.asset(Images.mainvector, color: Colors.black),
              SizedBox(height: TSizes.defaultSpace),
              commonText(text: 'Thanks for being with us.'),
              SizedBox(height: 300),
            ],
          ),
        ),
        bottomNavigationBar: commonBottomNavigationBar(
          context,
          dasboadmodel,
        ),
      ),
    );
  }
}
