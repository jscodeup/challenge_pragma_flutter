import 'dart:convert';
import 'package:cat_breeds_app/config/constants.dart';
import 'package:cat_breeds_app/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<dynamic> get(String endpoint) async {
    final response = await httpClient.get(
      Uri.parse('${ApiConstants.baseUrl}$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException(
        message: 'Error de servidor: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }
  }
}
