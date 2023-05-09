import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_qr_scanner/src/data/repositories/repositories.dart';
import 'package:test_qr_scanner/src/data/use_cases/use_cases.dart';

class CreateQrUseCase extends UseCaseNoParams<Map<String, dynamic>> {
  final ApiRepository repository;
  CreateQrUseCase({required this.repository});

  @override
  Future<Map<String, dynamic>> call() async {
    http.Response response = await repository.createQr();
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      default:
        throw UseCaseException(jsonResponse['message']);
    }
  }
}
