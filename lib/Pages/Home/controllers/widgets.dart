import 'package:flutter/material.dart';

class CustomAlign extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final String? imagePath;
  final double? width;
  final double? height;
  final Widget? child;

  const CustomAlign({
    super.key,
    this.alignment,
    this.imagePath,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child:
          child ??
          (imagePath != null
              ? Image.asset(imagePath!, width: width, height: height)
              : const SizedBox()),
    );
  }
}

Widget productCard({
  String? imageUrl,
  String? title,
  String? subtitle,
  String? price,
  VoidCallback? onTap,
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
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
                color: Colors.white,
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
  String? subtitle,
  String? buttonText,
  VoidCallback? onTap,
  double width = 250,
  double height = 320,
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
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
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
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              if (title != null) ...[
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              if (buttonText != null) ...[
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
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

