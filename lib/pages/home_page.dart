import 'package:flutter/material.dart';
import '../components/custom_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Nymmp')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              text: 'Sign In',
              onPressed: () => Navigator.pushNamed(context, '/login'),
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'Create an Account',
              onPressed: () => Navigator.pushNamed(context, '/signup'),
            ),
          ],
        ),
      ),
    );
  }
}
