import 'dart:math';

import 'package:flutter/material.dart';

LinearGradient customLinearGradient(BuildContext context, int rotationValue) {
  return LinearGradient(
    colors: [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.tertiary,
    ],
    transform: GradientRotation(pi / rotationValue),
  );
}
