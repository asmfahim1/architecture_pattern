import 'package:architecture_pattern/features/auth/presentation/ui/login_page.dart';
import 'package:architecture_pattern/features/dashboard/presentation/ui/dashboard_page.dart';
import 'package:architecture_pattern/features/dashboard/presentation/ui/product_details_page.dart';
import 'package:architecture_pattern/features/dashboard/presentation/ui/product_list_page.dart';
import 'package:architecture_pattern/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String productList = '/products';
  static const String productDetails = '/product-details';

  static Map<String, WidgetBuilder> get routes => {
    initial: (_) => const SplashScreen(),
    login: (_) => const LoginPage(),
    dashboard: (_) => const DashboardPage(),
    productList: (_) => const ProductListPage(),
    productDetails: (context) => const ProductDetailsPage(),
  };
}