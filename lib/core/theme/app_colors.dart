// Color definitions
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary brand colors
  static const Color primary = Color(0xFF6366F1); // Indigo-500
  static const Color primaryVariant = Color(0xFF4F46E5); // Indigo-600

  // Secondary colors
  static const Color secondary = Color(0xFF10B981); // Emerald-500
  static const Color secondaryVariant = Color(0xFF059669); // Emerald-600

  // Backgrounds
  static const Color lightBackground = Color(0xFFF9FAFB); // Gray-50
  static const Color darkBackground = Color(0xFF111827); // Gray-900

  // Surfaces
  static const Color lightSurface = Colors.white;
  static const Color darkSurface = Color(0xFF1F2937); // Gray-800

  // Text colors
  static const Color lightOnSurface = Color(0xFF111827); // Gray-900
  static const Color darkOnSurface = Color(0xFFF9FAFB); // Gray-50
  static const Color lightOnPrimary = Colors.white;
  static const Color darkOnPrimary = Colors.white;

  // Error colors
  static const Color error = Color(0xFFEF4444); // Red-500
  static const Color onError = Colors.white;

  // Disabled states
  static const Color disabled = Color(0xFF9CA3AF); // Gray-400

  // Divider colors
  static const Color lightDivider = Color(0xFFE5E7EB); // Gray-200
  static const Color darkDivider = Color(0xFF374151); // Gray-700

  // Overlay colors
  static const Color lightOverlay = Color(0x80F9FAFB); // Gray-50 with 50% opacity
  static const Color darkOverlay = Color(0x80111827); // Gray-900 with 50% opacity
}
