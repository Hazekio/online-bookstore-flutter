  import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiConstants {
  // Laravel API base URL

  // Flutter Web (Chrome)
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // Android Emulator
  // static const String baseUrl = 'http://10.0.2.2:8000/api';

  // Physical Device
  // static const String baseUrl = 'http://192.168.1.10:8000/api';
}

class ApiService {

  Future<dynamic> get(String endpoint,{String? token}) async {

    final response = await http.get(
      Uri.parse("${ApiConstants.baseUrl}$endpoint"),
      headers: {
        "Accept": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) { //500 is a laravel code error, 422 is a database error, 404 is an endpoint error
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<dynamic> post(
      String endpoint,
      Map<String, dynamic> body,
      {String? token}
      ) async {
    final response = await http.post(
      Uri.parse("${ApiConstants.baseUrl}$endpoint"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);

    } else {
      throw Exception("Request failed");
    }
  }

}