import 'package:flutter/material.dart';

Widget commonButton({
  VoidCallback? onPressed,
  String? text,
  Widget? child,
  Color? backgroundColor,
  Color? textColor,
  double? fontSize,
  EdgeInsetsGeometry? padding,
  double borderRadius = 8.0,
  double? elevation,
  double? width,
  double? height,
  Widget? prefixIcon, // 👈 New
  Widget? suffixIcon, // 👈 New
}) {
  final button = ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        backgroundColor ?? Colors.blue,
      ),
      foregroundColor: MaterialStateProperty.all(textColor ?? Colors.white),
      padding: MaterialStateProperty.all(
        padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      elevation: MaterialStateProperty.all(elevation ?? 2),
      textStyle: MaterialStateProperty.all(TextStyle(fontSize: fontSize)),
    ),
    child:
        child ??
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[prefixIcon, const SizedBox(width: 8)],
            Text(text ?? "Button"),
            if (suffixIcon != null) ...[const SizedBox(width: 8), suffixIcon],
          ],
        ),
  );

  return width != null
      ? SizedBox(width: width, height: height, child: button)
      : button;
}

Widget commonTextButton({
  required VoidCallback? onPressed,
  String? text,
  Widget? child,
  TextStyle? textStyle,
  bool underline = false,
  Color? underlineColor,
  Color? textColor,
  double? fontSize,
  EdgeInsetsGeometry? padding,
  AlignmentGeometry? alignment,
  bool autofocus = false,
  Clip clipBehavior = Clip.none,
  FocusNode? focusNode,
}) {
  final defaultTextStyle = TextStyle(
    color: textColor,
    fontSize: fontSize,
    decoration: underline ? TextDecoration.underline : TextDecoration.none,
    decorationColor: underline ? underlineColor : null,
  );

  return Align(
    alignment: alignment ?? Alignment.centerLeft,
    child: TextButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      style: TextButton.styleFrom(padding: padding),
      child:
          child ?? Text(text ?? 'Button', style: textStyle ?? defaultTextStyle),
    ),
  );
}
