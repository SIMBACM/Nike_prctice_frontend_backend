import 'package:flutter/material.dart';

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
  final hasDecoration = color != null ||
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

  return onTap != null ? GestureDetector(onTap: onTap, child: container) : container;
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
