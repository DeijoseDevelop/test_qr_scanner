import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:test_qr_scanner/src/controllers/controllers.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    ScannerController controller = context.watch<ScannerController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner View'),
        actions: <IconButton>[
          IconButton(
              onPressed: controller.clean,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
      body: controller.data != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Text>[
                  Text("USER: '${controller.data!['email']}'"),
                  Text("PASSWORD: '${controller.data!['password']}'"),
                ],
              ),
            )
          : MobileScanner(
              onDetect: (BarcodeCapture barcodeCapture) async {
                controller.scannerController.stop();
                controller.validateCode(barcodeCapture.barcodes[0]);
              },
            ),
    );
  }
}
