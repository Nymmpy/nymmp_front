import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/api_service.dart'; // API 서비스 경로 확인 필요
import 'custom_text_field.dart'; // CustomTextField 임포트
import 'custom_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  void _handleLogin(BuildContext context) async {
    try {
      var response = await apiService.login(
        emailController.text,
        passwordController.text,
      );
      if (response['success']) {
        context.go('/main');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Login failed. Please check your credentials and try again.')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTextField(
          label: 'Email',
          controller: emailController,
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextField(
          label: 'Password',
          controller: passwordController,
          hintText: 'Enter your password',
          obscureText: true,
        ),
        SizedBox(height: 24),
        CustomButton(
          text: 'Login',
          onPressed: () => _handleLogin(context),
        ),
      ],
    );
  }
}
