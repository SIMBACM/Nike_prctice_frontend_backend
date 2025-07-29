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
  double? elevation
}) {
  final container = Card(
    elevation: elevation,
    child: Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        image: backgroundImage != null ? backgroundImage : null,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: child,
    ),
  );

  return onTap != null
      ? GestureDetector(
          onTap: onTap,
          child: container,
        )
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

