import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spendly/constants/custom_gradient.dart';

class GradientTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const GradientTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<GradientTextFormField> createState() => _GradientTextFormFieldState();
}

class _GradientTextFormFieldState extends State<GradientTextFormField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {}); // Trigger a rebuild when the text changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(
        fontSize: 50, // Text size
        foreground: Paint()
          ..shader = customLinearGradient(context, 5).createShader(
            const Rect.fromLTWH(0, 0, 200, 70),
          ),
      ),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          CupertinoIcons.money_dollar,
          size: 25, // Dollar sign size
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
