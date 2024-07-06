import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/group_page.dart';
import 'pages/poll_page.dart';
import 'pages/result_page.dart';
import 'pages/my_page.dart';

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
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/group': (context) => GroupPage(groupId: ModalRoute.of(context)!.settings.arguments as int),
        '/poll': (context) => PollPage(pollId: ModalRoute.of(context)!.settings.arguments as int),
        '/result': (context) => ResultPage(groupId: ModalRoute.of(context)!.settings.arguments as int),
        '/mypage': (context) => MyPage(),
      },
    );
  }
}
