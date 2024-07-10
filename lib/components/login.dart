import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/api_service.dart';
import '../utils/auth_notifier.dart';
import 'custom_text_field.dart';
import 'custom_button.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  // 로그인 버튼을 눌렀을 때 호출되는 함수
  void _handleLogin(BuildContext context) async {
    try {
      var response = await apiService.login(
        context,
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( // 스크롤 가능하도록 수정
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16),
              Image.asset(
                'assets/NymmpLogo.png',
                width: 122,
                height: 43,
              ),
              SizedBox(height: 16),
              Text(
                'Madcamp Anonymous Poll!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32),
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
          ),
        ),
      ),
    );
  }
}
