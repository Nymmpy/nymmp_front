import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import '../utils/api_service.dart';
import 'custom_button.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final ApiService apiService = ApiService();

  int selectedGroupId = 1;
  bool isLoading = false;

  int kakaoId = 1234;
  void signUp() async {
    setState(() {
      isLoading = true;
    });

    var response = await apiService.signUp(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      groupId: selectedGroupId,
      kakaoId: kakaoId
      // code: codeController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (response['status'] == 200) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print("${response}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to sign up")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CustomTextField(
          label: 'Enter your email',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 8),
        DropdownButton<int>(
          value: selectedGroupId,
          onChanged: (int? newValue) {
            setState(() {
              selectedGroupId = newValue!;
            });
          },
          items: <DropdownMenuItem<int>>[
            DropdownMenuItem<int>(
              value: 1,
              child: Text('Group 1'),
            ),
            DropdownMenuItem<int>(
              value: 2,
              child: Text('Group 2'),
            ),
            DropdownMenuItem<int>(
              value: 3,
              child: Text('Group 3'),
            ),
            DropdownMenuItem<int>(
              value: 4,
              child: Text('Group 4'),
            ),
          ],
        ),
        SizedBox(height: 8),
        CustomTextField(
          label: 'Enter your name',
          controller: nameController,
        ),
        SizedBox(height: 8),
        CustomTextField(
          label: 'Enter your password',
          controller: passwordController,
          obscureText: true,
        ),
        SizedBox(height: 8),
        CustomTextField(
          label: 'Check your password',
          controller: confirmPasswordController,
          obscureText: true,
        ),
        SizedBox(height: 8),
        CustomTextField(
          label: 'CODE',
          controller: codeController,
        ),
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
