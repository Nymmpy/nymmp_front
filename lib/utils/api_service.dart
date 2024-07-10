import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'auth_notifier.dart';

class ApiService {
  final String baseUrl = 'http://localhost:8080'; // 서버 주소
  final storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> login(BuildContext context, String email, String password) async {
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
      final jwtToken = response.headers['authorization']; // 응답 헤더에서 JWT 토큰 추출

      if (jwtToken != null) {
        Provider.of<AuthNotifier>(context, listen: false).setToken(jwtToken);
        return {'success': true, 'token': jwtToken};
      } else {
        return {'success': false, 'message': 'Failed to login: JWT token is null'};
      }
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
        'kakaoId': kakaoId.toString()
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'status': response.statusCode, 'message': 'Failed to sign up'};
    }
  }

  Future<Map<String, dynamic>> fetchMyPageData(String jwtToken) async {
    if (jwtToken == null || jwtToken.isEmpty) {
      return Future.error("JWT token is null or empty");
    }

    final url = Uri.parse('$baseUrl/api/mypage');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load my page data');
    }
  }
}
