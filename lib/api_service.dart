import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:3000"; // Ganti dengan URL server Anda jika perlu

  // Fungsi untuk Register
  Future<Map<String, dynamic>> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return {'message': json.decode(response.body)['message']};
    } else {
      return {'message': 'Failed to register user'};
    }
  }

  // Fungsi untuk Login
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return {
        'message': json.decode(response.body)['message'],
        'token': json.decode(response.body)['token']
      };
    } else {
      return {'message': 'Invalid username or password'};
    }
  }
}
