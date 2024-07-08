// lib/pages/signup_page.dart
import 'package:flutter/material.dart';
import '../components/sign_up_form.dart'; // SignUpForm 컴포넌트 임포트

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center 위젯으로 감쌈
        child: SingleChildScrollView(
          child: SignUpForm(),
        ),
      ),
    );
  }
}
