import 'package:flutter/material.dart';
import 'custom_text_field.dart'; // 커스텀 텍스트 필드 임포트
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api_service.dart';
import 'custom_button.dart';

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
  final TextEditingController codeController =
      TextEditingController(); // 코드 입력 컨트롤러 추가
  final ApiService apiService = ApiService();

  String selectedGroup = 'Group 1'; // 예시 그룹, 초기값 설정
  bool isLoading = false; // 로딩 상태 표시

  void signUp() async {
    setState(() {
      isLoading = true;
    });

    var response = await apiService.signUp(
      id: idController.text,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      group: selectedGroup,
      code: codeController.text,
    );

    if (response['status'] == 200) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to sign up")));
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
        DropdownButton<String>(
          value: selectedGroup,
          onChanged: (String? newValue) {
            setState(() {
              selectedGroup = newValue!;
            });
          },
          items: <String>['Group 1', 'Group 2', 'Group 3', 'Group 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
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
        CustomTextField(label: 'Code', controller: codeController),
        SizedBox(height: 24),
        isLoading
            ? CircularProgressIndicator()
            : CustomButton(
                text: 'Sign Up',
                onPressed: signUp,
              ),
      ],
    );
  }
}
