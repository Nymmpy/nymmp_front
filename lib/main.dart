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
        scaffoldBackgroundColor: Color(0xFFF0F4C3),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/group') {
          final args = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => GroupPage(groupId: args),
          );
        } else if (settings.name == '/poll') {
          final args = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => PollPage(pollId: args),
          );
        } else if (settings.name == '/result') {
          final args = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => ResultPage(groupId: args),
          );
        }

        // 기본 라우팅 처리
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => LoginPage());
          case '/main':
            return MaterialPageRoute(builder: (context) => MainPage());
          case '/mypage':
            return MaterialPageRoute(builder: (context) => MyPage());
          default:
            return null;
        }
      },
    );
  }
}
