import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/custom_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              text: 'Sign In',
              onPressed: () => context.go('/login'),
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'Create an Account',
              onPressed: () => context.go('/signup'),
            ),
          ],
        ),
      ),
    );
  }
}
