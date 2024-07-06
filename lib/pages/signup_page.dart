// lib/pages/signup_page.dart
import 'package:flutter/material.dart';
import '../components/sign_up_form.dart'; // SignUpForm 컴포넌트 임포트

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: SingleChildScrollView(
        // 스크롤 가능하게 만듦
        child: SignUpForm(), // SignUpForm을 로드
      ),
    );
  }
}
