import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/group_page.dart';
import 'pages/poll_page.dart';
import 'pages/result_page.dart';
import 'pages/my_page.dart';
import 'components/header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF0F4C3), // 파스텔톤 배경색 설정
        fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/poll/:pollId': (context) => PollPage(pollId: "1",),
        '/group/:groupId': (context) => GroupPage(groupId: "1",),
        '/result/:groupId': (context) => ResultPage(groupId: "1",),
        '/mypage': (context) => MyPage(),
      },
    );
  }
}
