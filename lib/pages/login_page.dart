import 'package:flutter/material.dart';
import '../components/login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'login',
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
                'madcamp anonymous poll!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32),
              Login(),
            ],
          ),
        ),
      ),
    );
  }
}
