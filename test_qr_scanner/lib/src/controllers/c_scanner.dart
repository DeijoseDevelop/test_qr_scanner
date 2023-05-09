import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController extends ChangeNotifier {
  MobileScannerController scannerController = MobileScannerController();
  Map<String, dynamic>? data;

  void validateCode(Barcode barcode) {
    data = json.decode(barcode.rawValue!);
    log("Barcode: ${barcode.rawValue}");
    notifyListeners();
  }

  void clean() {
    data = null;
    notifyListeners();
  }
}
