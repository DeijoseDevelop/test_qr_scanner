import 'package:flutter/material.dart';
import 'package:test_qr_scanner/src/ui/routes/app_routes.dart';
import 'package:test_qr_scanner/src/ui/views/views.dart';

class AppViews {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case AppRoutes.scanner:
        return MaterialPageRoute(builder: (_) => const ScannerView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
