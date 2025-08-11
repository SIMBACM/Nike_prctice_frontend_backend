import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/colors.dart';

Widget commonContainer({
  double? width,
  double? height,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  Widget? child,
  Color? color,
  DecorationImage? backgroundImage,
  BoxBorder? border,
  BorderRadiusGeometry? borderRadius,
  List<BoxShadow>? boxShadow,
  VoidCallback? onTap,
  double? elevation,
  BoxShape shape = BoxShape.rectangle,
}) {
  final hasDecoration =
      color != null ||
      backgroundImage != null ||
      border != null ||
      borderRadius != null ||
      (boxShadow != null && boxShadow.isNotEmpty) ||
      shape != BoxShape.rectangle;

  final container = Card(
    elevation: elevation,
    color: Colors.transparent,
    shadowColor: Colors.transparent,
    child: Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: hasDecoration
          ? BoxDecoration(
              color: color,
              image: backgroundImage,
              border: border,
              borderRadius: shape == BoxShape.circle ? null : borderRadius,
              shape: shape, // Apply BoxShape
              boxShadow: boxShadow,
            )
          : null,
      child: child,
    ),
  );

  return onTap != null
      ? GestureDetector(onTap: onTap, child: container)
      : container;
}

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final double size;
  final Color selectedColor;
  final Color borderColor;

  const CustomRadioButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    this.size = 24.0,
    this.selectedColor = Colors.white,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 2),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: size / 2,
                  height: size / 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedColor,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

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
    child: Padding(
      padding: const EdgeInsets.only(left: 8), 
      child: Opacity(
        opacity: 1, 
        child: Container(
          width: 142, 
          height: 277, 
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.secondary,
              width: 2, 
              style: BorderStyle.solid,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
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
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    color: isFavorite ? Colors.amber : Colors.red,
                    onPressed: onPressed,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title ?? 'Product Title',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle ?? 'Product Subtitle',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                'MRP : ₹ ${price ?? '0.00'}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
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
  Alignment? alignment,
  Color? textColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
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
                  colors: [
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                    const Color.fromARGB(0, 255, 255, 255),
                  ],
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
                    alignment: alignment ?? Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10, top: 30),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
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

Widget tappableImage({
  required String imagePath,
  VoidCallback? onTap,
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
  Key? key,
  Alignment alignment = Alignment.center,
  Color? color,
  BlendMode? colorBlendMode,
  String? semanticLabel,
  bool excludeFromSemantics = false,
  FilterQuality filterQuality = FilterQuality.low,
  BorderRadius? borderRadius, // 👈 NEW PARAM
}) {
  Widget image = Image.asset(
    imagePath,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    color: color,
    colorBlendMode: colorBlendMode,
    semanticLabel: semanticLabel,
    excludeFromSemantics: excludeFromSemantics,
    filterQuality: filterQuality,
  );

  if (borderRadius != null) {
    image = ClipRRect(borderRadius: borderRadius, child: image);
  }

  return GestureDetector(key: key, onTap: onTap, child: image);
}

Widget simpleListTile({
  String? title,
  String? subtitle,
  VoidCallback? onTap,
  double? width,
  double? height,
  double? titleFontSize,
  double? subtitleFontSize,
  FontWeight? titleFontWeight,
  FontWeight? subtitleFontWeight,
  Color? titleColor,
  Color? subtitleColor,
  EdgeInsetsGeometry? padding,
  Widget? trailingIcon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      padding:
          padding ??
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != null)
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: titleFontWeight ?? FontWeight.bold,
                    fontSize: titleFontSize ?? 16,
                    color: titleColor ?? Colors.black,
                  ),
                ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: subtitleFontSize ?? 14,
                    fontWeight: subtitleFontWeight ?? FontWeight.normal,
                    color: subtitleColor ?? Colors.grey,
                  ),
                ),
              ],
            ],
          ),
          trailingIcon ??
              const Icon(Icons.chevron_right, size: 24, color: Colors.black),
        ],
      ),
    ),
  );
}
