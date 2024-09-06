import 'dart:math';

import 'package:flutter/material.dart';

BoxDecoration customLinearGradient(BuildContext context, int rotationValue) {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
        Theme.of(context).colorScheme.tertiary,
      ],
      transform: GradientRotation(pi / rotationValue),
    ),
    borderRadius: BorderRadius.circular(20),
  );
}
