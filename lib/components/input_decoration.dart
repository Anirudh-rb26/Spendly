import 'package:flutter/material.dart';

InputDecoration customInputDecorationWithSuffixIcon(
  String hintText,
  Widget prefixIcon,
  Widget suffixIcon,
) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(fontWeight: FontWeight.w300),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
  );
}

InputDecoration customInputDecoration(String hintText, Widget prefixIcon) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(fontWeight: FontWeight.w300),
    prefixIcon: prefixIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
  );
}
