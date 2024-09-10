import 'package:flutter/material.dart';
import 'package:spendly/constants/custom_gradient.dart';

dynamic saveButton(
  BuildContext context,
  String buttonText,
  void Function()? onPressed,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: customLinearGradient(context, 6),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
        onPressed: () {
          onPressed!();
        },
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
