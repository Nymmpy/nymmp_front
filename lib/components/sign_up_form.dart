import 'package:flutter/material.dart';
import 'custom_text_field.dart'; // 커스텀 텍스트 필드 컴포넌트 임포트
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedGroup = 'Group 1'; // 예시 그룹
  bool isLoading = false;

  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    var response = await http.post(
      Uri.parse('https://api.yourdomain.com/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': idController.text,
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'group': selectedGroup,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to sign up")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTextField(label: 'ID', controller: idController),
        CustomTextField(label: 'Name', controller: nameController),
        CustomTextField(
            label: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress),
        CustomTextField(
            label: 'Password',
            controller: passwordController,
            obscureText: true),
        CustomTextField(
            label: 'Confirm Password',
            controller: confirmPasswordController,
            obscureText: true),
        // Dropdown 및 기타 요소 포함...
        SizedBox(height: 20),
        isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: signUp,
                child: Text('Sign up'),
              ),
      ],
    );
  }
}
