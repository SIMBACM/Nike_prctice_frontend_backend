import 'package:flutter/material.dart';

Widget commonText({
  required String text,
  Color color = Colors.black,
  double fontSize = 16,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? overflow,
  double? height,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
    ),
  );
}
