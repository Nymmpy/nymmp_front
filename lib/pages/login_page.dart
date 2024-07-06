import 'package:flutter/material.dart';
import '../components/login.dart';
import "../components/header.dart";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // 높이 설정
        child: Header(isMyPage: false),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Login(),
          ],
        ),
      ),
    );
  }
}
