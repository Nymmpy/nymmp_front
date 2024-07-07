import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => MainPage(),
      ),
      GoRoute(
        path: '/group/:groupId',
        builder: (context, state) {
          final groupId = int.parse(state.params['groupId']!);
          return GroupPage(
            groupId: groupId,
            goldMedalUser: "Minsoo",
            silverMedalUser: "Young",
            bronzeMedalUser: "Chero",
            groupName: "MadCamp 1",
            questionText: "Q2",
          );
        },
      ),
      GoRoute(
        path: '/poll/:pollId',
        builder: (context, state) {
          final pollId = int.parse(state.params['pollId']!);
          return PollPage(
            pollId: pollId,
            questionText: "What are you doing?",
          );
        },
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) {
          final groupId = state.extra as int;
          return ResultPage(groupId: groupId);
        },
      ),
      GoRoute(
        path: '/mypage',
        builder: (context, state) => MyPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
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
    );
  }
}
