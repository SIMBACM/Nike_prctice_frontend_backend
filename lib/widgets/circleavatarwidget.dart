import 'package:flutter/material.dart';

Widget buildAvatar({
  double? radius,
  Color? backgroundColor,
  Color? foregroundColor,
  Widget? child,
  ImageProvider? backgroundImage,
  ImageProvider? foregroundImage,
}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    backgroundImage: backgroundImage,
    foregroundImage: foregroundImage,
    child: child,
  );
}
