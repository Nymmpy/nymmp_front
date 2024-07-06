import 'package:flutter/material.dart';
import '../components/login.dart'; // 로그인 로직이 포함된 컴포넌트
import '../components/header.dart'; // 사용자 정의 헤더

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Login(), // 사용자 로그인을 처리하는 컴포넌트
          ],
        ),
      ),
    );
  }
}
