import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/custom_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo image
              Image.asset(
                'assets/NymmpLogo.png', //앱로고로 대체 필요
                width: 200,
                height: 200,
              ),
              SizedBox(height: 16),
              Image.asset(
                'assets/NymmpLogo.png',
                width: 200,
                height: 100,
              ),
              Text(
                'madcamp anonymous poll!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32),
              CustomButton(
                text: 'Sign In',
                onPressed: () => context.go('/login'),
              ),
              SizedBox(height: 16),
              CustomButton(
                text: 'Create an Account',
                onPressed: () => context.go('/signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
