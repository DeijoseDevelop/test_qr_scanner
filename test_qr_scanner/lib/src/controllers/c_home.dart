import 'package:flutter/material.dart';
import 'package:test_qr_scanner/src/data/use_cases/use_cases.dart';

class HomeController extends ChangeNotifier {
  String? message;

  CreateQrUseCase createQrUseCase;
  HomeController({
    required this.createQrUseCase,
  });

  Future<void> generateQr() async {
    Map<String, dynamic> response = await createQrUseCase.call();
    message = response['message'];
    notifyListeners();
  }
}
