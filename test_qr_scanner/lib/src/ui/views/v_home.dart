// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_qr_scanner/src/controllers/controllers.dart';
import 'package:test_qr_scanner/src/ui/routes/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.scanner),
              child: const Text('Scanner'),
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.generateQr();
                if (controller.message != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(controller.message!),
                    ),
                  );
                }
              },
              child: const Text('Create QR'),
            ),
          ],
        ),
      ),
    );
  }
}
