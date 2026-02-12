import 'package:flutter/material.dart';
import 'package:green_app/core/styles/colors.dart';

abstract class TextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle body = TextStyle(fontSize: 16);
  static const TextStyle caption1 = TextStyle(fontSize: 14);
  static const TextStyle caption2 = TextStyle(
    fontSize: 12,
    color: ColorApp.grey,
  );
}
