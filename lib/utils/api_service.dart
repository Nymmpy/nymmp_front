// lib/services/api_service.dart
import 'dart:async';
import 'dart:convert';

class ApiService {
  // Mock 데이터: 실제 로그인 정보
  final Map<String, dynamic> _mockUser = {
    'email': 'test',
    'password': '123',
    'success': true
  };

  Future<Map<String, dynamic>> login(String email, String password) async {
    // 네트워크 지연 시뮬레이션
    await Future.delayed(Duration(seconds: 1));

    // 이메일과 비밀번호 일치 확인
    if (email == _mockUser['email'] && password == _mockUser['password']) {
      return {'success': true};
    } else {
      return {'success': false};
    }
  }
}
