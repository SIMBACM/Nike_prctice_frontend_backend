import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';

Widget productCard({
  String? imageUrl,
  String? title,
  String? subtitle,
  String? price,
  VoidCallback? onTap,
  VoidCallback? onPressed,
  bool isFavorite = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl ?? 'https://via.placeholder.com/150',
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                color: isFavorite ? Colors.amber : Colors.red,
                onPressed: onPressed,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title ?? 'Product Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            subtitle ?? 'Product Subtitle',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 4),
          Text(
            'MRP : ₹ ${price ?? '0.00'}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget lebronCard({
  String? assetImagePath,
  String? title,
  double? fontsize,
  FontWeight? fontWeight,
  String? subtitle,
  String? buttonText,
  VoidCallback? onTap,
  double width = 250,
  double height = 320,
  Color? color,
  Color? subtitlecolor,
  FontWeight? subtitlefontweight,
  double? subtitlefontSize,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: assetImagePath != null
          ? DecorationImage(
              image: AssetImage(assetImagePath),
              fit: BoxFit.cover,
            )
          : null,
      color: assetImagePath == null ? Colors.grey.shade300 : null,
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            ),
          ),
        ),
        Positioned(
          left: 16,
          bottom: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: fontWeight,
                  ),
                ),
              if (subtitle != null) ...[
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: subtitlecolor,
                    fontSize: subtitlefontSize,
                    fontWeight: subtitlefontweight,
                  ),
                ),
              ],
              if (buttonText != null) ...[
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}

Widget commonCard({
  String? title,
  String? assetImagePath,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  BorderRadius? borderRadius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: assetImagePath != null
            ? DecorationImage(
                image: AssetImage(assetImagePath),
                fit: BoxFit.cover,
              )
            : null,
        color: assetImagePath == null
            ? const Color.fromRGBO(255, 255, 255, 1)
            : null,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                SizedBox(height: 4),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, top: 50),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    ),
  );
}

Widget commonCard1({
  String? title,
  String? assetImagePath,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  BorderRadius? borderRadius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: assetImagePath != null
            ? DecorationImage(
                image: AssetImage(assetImagePath),
                fit: BoxFit.cover,
              )
            : null,
        color: assetImagePath == null
            ? const Color.fromRGBO(255, 255, 255, 1)
            : null,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                SizedBox(height: 4),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, top: 50),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    ),
  );
}

Widget commonCard2({
  String? title,
  String? assetImagePath,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  BorderRadius? borderRadius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            image: assetImagePath != null
                ? DecorationImage(
                    image: AssetImage(assetImagePath),
                    fit: BoxFit.cover,
                  )
                : null,
            color: assetImagePath == null ? Colors.grey.shade300 : null,
          ),
        ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 4),
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
      ],
    ),
  );
}

class CommonHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommonHomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CommonHomeAppBar> createState() => _CommonHomeAppBarState();
}

class _CommonHomeAppBarState extends State<CommonHomeAppBar> {
  bool isNike = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  duration: const Duration(milliseconds: 250),
                  child: commonContainer(
                    width: 34,
                    height: 34,
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Align(
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
                Align(
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
            icon: const Icon(Icons.search_sharp),
          ),
        ],
      ),
    );
  }
}
