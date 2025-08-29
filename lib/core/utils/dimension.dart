// lib/core/utils/dimensions.dart
import 'package:flutter/widgets.dart';

class Dimensions {
  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
// Add font, padding, radius, etc.
}