import 'package:flutter/material.dart';


Widget commonTextFormField({
  TextEditingController? controller,
  String? labelText,
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool obscureText = false,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  TextStyle? textStyle,
  TextStyle? hintStyle,
  InputBorder? border,
  InputBorder? focusedBorder,
  InputBorder? enabledBorder,
  int maxLines = 1,
  bool readOnly = false,
  bool showCursor = true,
  VoidCallback? onTap,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    validator: validator,
    maxLines: maxLines,
    readOnly: readOnly,
    showCursor: showCursor,
    onTap: onTap,
    style: textStyle,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      hintStyle: hintStyle,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: border ?? const OutlineInputBorder(),
      focusedBorder: focusedBorder,
      enabledBorder: enabledBorder,
    ),
  );
}

