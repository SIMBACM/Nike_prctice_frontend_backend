import 'package:flutter/material.dart';

Widget customQtyDropdown<T>({
  required String label,
  required List<T> items,
  T? selectedValue,
  void Function(T?)? onChanged,
  String Function(T)? itemLabelBuilder,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      const SizedBox(width: 8),
      DropdownButton<T>(
        value: selectedValue,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        style: const TextStyle(color: Colors.black, fontSize: 16),
        items: items.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(itemLabelBuilder?.call(value) ?? value.toString()),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ],
  );
}
