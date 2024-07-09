import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://localhost:8080'; // 서버 주소

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/login'); // 로그인 엔드포인트

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'success': false, 'message': 'Failed to login'};
    }
  }

  Future<Map<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
    required int kakaoId,
    required int groupId,
    // required String code,
  }) async {
    final url = Uri.parse('$baseUrl/api/join'); // 회원가입 엔드포인트

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'groupId': groupId.toString(),
        // 'code': code,,
        'kakaoId':kakaoId.toString()
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'status': response.body, 'message': 'Failed to sign up'};
    }
  }
}
