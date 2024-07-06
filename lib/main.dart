import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
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
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'PatrickHand'),
          bodyMedium: TextStyle(fontFamily: 'PatrickHand'),
          bodySmall: TextStyle(fontFamily: 'PatrickHand'),
          displayLarge: TextStyle(fontFamily: 'PatrickHand'),
          displayMedium: TextStyle(fontFamily: 'PatrickHand'),
          displaySmall: TextStyle(fontFamily: 'PatrickHand'),
          headlineLarge: TextStyle(fontFamily: 'PatrickHand'),
          headlineMedium: TextStyle(fontFamily: 'PatrickHand'),
          headlineSmall: TextStyle(fontFamily: 'PatrickHand'),
          titleLarge: TextStyle(fontFamily: 'PatrickHand'),
          titleMedium: TextStyle(fontFamily: 'PatrickHand'),
          titleSmall: TextStyle(fontFamily: 'PatrickHand'),
          labelLarge: TextStyle(fontFamily: 'PatrickHand'),
          labelMedium: TextStyle(fontFamily: 'PatrickHand'),
          labelSmall: TextStyle(fontFamily: 'PatrickHand'),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/main': (context) => MainPage(),
        '/group': (context) => GroupPage(
            groupId: ModalRoute.of(context)!.settings.arguments as int),
        '/poll': (context) =>
            PollPage(pollId: ModalRoute.of(context)!.settings.arguments as int),
        '/result': (context) => ResultPage(
            groupId: ModalRoute.of(context)!.settings.arguments as int),
        '/mypage': (context) => MyPage(),
      },
    );
  }
}
