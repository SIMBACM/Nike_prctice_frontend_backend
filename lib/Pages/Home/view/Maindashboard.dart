import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Home/controllers/services/product.dart';
import 'package:nike_prctice/Pages/Home/controllers/widgets.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class Maindashboard extends StatefulWidget {
  final String? fetchedusername;
  const Maindashboard({super.key, this.fetchedusername});

  @override
  State<Maindashboard> createState() => _MaindashboardState();
}

class _MaindashboardState extends State<Maindashboard> {
  bool isNike = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonContainer(
              width: 70,
              height: 35,
              onTap: () {
                setState(() {
                  isNike = !isNike;
                });
              },
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50),
              child: Stack(
                children: [
                  AnimatedAlign(
                    curve: Curves.easeInOut,
                    alignment: isNike
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    duration: Duration(milliseconds: 250),
                    child: commonContainer(
                      width: 34,
                      height: 34,
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  CustomAlign(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Image.asset(
                        Images.mainvector,
                        width: 22,
                        height: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  CustomAlign(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Image.asset(
                        Images.vectorhomepage,
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              iconSize: 40,
              onPressed: () {},
              icon: Icon(Icons.search_sharp),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: TSizes.defaultSpace),
            Container(
              alignment: Alignment.center,
              child: commonText(
                text: 'Good Morning ${widget.fetchedusername}',
                fontSize: 24,
                fontWeight: TSizes.semiBold,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
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
            SizedBox(height: TSizes.spaceLarge),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                    title: 'Air Jordan 1 Low',
                    subtitle: "Women's Shoes",
                    price: '8,295.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
                    title: 'Nike Air Max 270',
                    subtitle: "Men's Running Shoes",
                    price: '10,495.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceLarge),
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
            SizedBox(height: TSizes.spaceLarge),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 6, right: 6),
                child: Row(
                  children: [
                    lebronCard(assetImagePath: Images.display),
                    SizedBox(width: TSizes.defaultSpace),
                    lebronCard(assetImagePath: Images.display),
                  ],
                ),
              ),
            ),
            SizedBox(height: TSizes.defaultSpace),
            lebronCard(assetImagePath: Images.display, height: 150, width: 300),
            SizedBox(height: TSizes.spaceLarge),
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
            SizedBox(height: TSizes.spaceLarge),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
                    title: 'Nike Air Max 270',
                    subtitle: "Men's Running Shoes",
                    price: '10,495.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceLarge),
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
            lebronCard(assetImagePath: Images.display, height: 250, width: 390),
            SizedBox(height: TSizes.defaultSpace),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
                    title: 'Nike Air Max 270',
                    subtitle: "Men's Running Shoes",
                    price: '10,495.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                ],
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
            SizedBox(height: TSizes.spaceLarge),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
                    title: 'Nike Air Max 270',
                    subtitle: "Men's Running Shoes",
                    price: '10,495.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceLarge),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
                    title: 'Nike Air Max 270',
                    subtitle: "Men's Running Shoes",
                    price: '10,495.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                  productCard(
                    imageUrl:
                        'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
                    title: 'Nike Blazer Mid',
                    subtitle: "Unisex Classic Shoes",
                    price: '8,999.00',
                  ),
                ],
              ),
            ),
            SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
