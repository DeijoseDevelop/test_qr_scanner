import 'dart:convert';
import 'dart:math' as math;
import 'package:test_qr_scanner/src/data/repositories/repositories.dart';
import "package:http/http.dart" as http;

class ApiRepository extends BaseRepository {
  String baseUrl = "http://localhost:5000/api/v1";
  Future<http.Response> createQr() async {
    final response = await http.post(
      Uri.parse('$baseUrl/generate/qr/'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {
          "email": "test${math.Random().nextInt(100)}@example.com",
          "password": "password${math.Random().nextInt(100)}",
        },
      ),
    );
    return response;
  }
}
