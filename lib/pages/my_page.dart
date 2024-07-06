import 'package:flutter/material.dart';
import '../components/header.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Header(isMyPage: true),
      ),
      body: Center(
        child: Text('마이 페이지', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
