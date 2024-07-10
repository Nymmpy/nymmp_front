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
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import './utils/auth_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthNotifier(),
      child: Consumer<AuthNotifier>(
        builder: (context, authNotifier, _) {
          final GoRouter _router = GoRouter(
            refreshListenable: authNotifier,
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
                  final poll = pollData.firstWhere((element) => element['poll_id'] == pollId);
                  return PollPage(
                    pollId: poll['poll_id'],
                    questionText: poll['question'],
                    options: poll['options'],
                    totalCount: poll['total_count'],
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
            redirect: (context, state) {
              final jwtToken = authNotifier.jwtToken;
              final bool loggedIn = jwtToken != null;
              final bool goingToHome = state.location == '/home' || state.location == '/login' || state.location == '/signup';

              if (!loggedIn && !goingToHome) return '/home';
              if (loggedIn && goingToHome) return '/main';

              return null;
            },
          );

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
        },
      ),
    );
  }
}


// Dummy poll data
List<Map<String, dynamic>> pollData = [
  {
    "poll_id": 1,
    "question": "Which sports are you interested in playing?",
    "total_count": 100,
    "options": [
      {"option_id": 1, "user_id": 1, "username": "User1", "vote_count": 10},
      {"option_id": 2, "user_id": 2, "username": "User2", "vote_count": 20},
      {"option_id": 3, "user_id": 3, "username": "User3", "vote_count": 30},
      {"option_id": 4, "user_id": 4, "username": "User4", "vote_count": 40},
    ],
  },
  {
    "poll_id": 2,
    "question": "What is your favorite color?",
    "total_count": 80,
    "options": [
      {"option_id": 1, "user_id": 5, "username": "User5", "vote_count": 10},
      {"option_id": 2, "user_id": 6, "username": "User6", "vote_count": 20},
      {"option_id": 3, "user_id": 7, "username": "User7", "vote_count": 25},
      {"option_id": 4, "user_id": 8, "username": "User8", "vote_count": 25},
    ],
  },
  {
    "poll_id": 3,
    "question": "What is your favorite food?",
    "total_count": 90,
    "options": [
      {"option_id": 1, "user_id": 9, "username": "User9", "vote_count": 15},
      {"option_id": 2, "user_id": 10, "username": "User10", "vote_count": 25},
      {"option_id": 3, "user_id": 11, "username": "User11", "vote_count": 20},
      {"option_id": 4, "user_id": 12, "username": "User12", "vote_count": 30},
    ],
  },
  {
    "poll_id": 4,
    "question": "Which city do you want to visit?",
    "total_count": 70,
    "options": [
      {"option_id": 1, "user_id": 13, "username": "User13", "vote_count": 15},
      {"option_id": 2, "user_id": 14, "username": "User14", "vote_count": 10},
      {"option_id": 3, "user_id": 15, "username": "User15", "vote_count": 20},
      {"option_id": 4, "user_id": 16, "username": "User16", "vote_count": 25},
    ],
  },
  {
    "poll_id": 5,
    "question": "What is your favorite movie genre?",
    "total_count": 110,
    "options": [
      {"option_id": 1, "user_id": 17, "username": "User17", "vote_count": 30},
      {"option_id": 2, "user_id": 18, "username": "User18", "vote_count": 20},
      {"option_id": 3, "user_id": 19, "username": "User19", "vote_count": 40},
      {"option_id": 4, "user_id": 20, "username": "User20", "vote_count": 20},
    ],
  },
  {
    "poll_id": 6,
    "question": "Which season do you like the most?",
    "total_count": 90,
    "options": [
      {"option_id": 1, "user_id": 1, "username": "User1", "vote_count": 25},
      {"option_id": 2, "user_id": 2, "username": "User2", "vote_count": 20},
      {"option_id": 3, "user_id": 3, "username": "User3", "vote_count": 30},
      {"option_id": 4, "user_id": 4, "username": "User4", "vote_count": 15},
    ],
  },
  {
    "poll_id": 7,
    "question": "What is your favorite animal?",
    "total_count": 95,
    "options": [
      {"option_id": 1, "user_id": 5, "username": "User5", "vote_count": 20},
      {"option_id": 2, "user_id": 6, "username": "User6", "vote_count": 25},
      {"option_id": 3, "user_id": 7, "username": "User7", "vote_count": 30},
      {"option_id": 4, "user_id": 8, "username": "User8", "vote_count": 20},
    ],
  },
  {
    "poll_id": 8,
    "question": "What is your favorite music genre?",
    "total_count": 85,
    "options": [
      {"option_id": 1, "user_id": 9, "username": "User9", "vote_count": 15},
      {"option_id": 2, "user_id": 10, "username": "User10", "vote_count": 30},
      {"option_id": 3, "user_id": 11, "username": "User11", "vote_count": 20},
      {"option_id": 4, "user_id": 12, "username": "User12", "vote_count": 20},
    ],
  },
  {
    "poll_id": 9,
    "question": "What is your favorite book genre?",
    "total_count": 75,
    "options": [
      {"option_id": 1, "user_id": 13, "username": "User13", "vote_count": 20},
      {"option_id": 2, "user_id": 14, "username": "User14", "vote_count": 10},
      {"option_id": 3, "user_id": 15, "username": "User15", "vote_count": 25},
      {"option_id": 4, "user_id": 16, "username": "User16", "vote_count": 20},
    ],
  },
  {
    "poll_id": 10,
    "question": "What is your favorite hobby?",
    "total_count": 65,
    "options": [
      {"option_id": 1, "user_id": 17, "username": "User17", "vote_count": 15},
      {"option_id": 2, "user_id": 18, "username": "User18", "vote_count": 20},
      {"option_id": 3, "user_id": 19, "username": "User19", "vote_count": 10},
      {"option_id": 4, "user_id": 20, "username": "User20", "vote_count": 20},
    ],
  },
  {
    "poll_id": 11,
    "question": "What is your favorite holiday destination?",
    "total_count": 70,
    "options": [
      {"option_id": 1, "user_id": 1, "username": "User1", "vote_count": 20},
      {"option_id": 2, "user_id": 2, "username": "User2", "vote_count": 15},
      {"option_id": 3, "user_id": 3, "username": "User3", "vote_count": 25},
      {"option_id": 4, "user_id": 4, "username": "User4", "vote_count": 10},
    ],
  },
  {
    "poll_id": 12,
    "question": "What is your favorite drink?",
    "total_count": 60,
    "options": [
      {"option_id": 1, "user_id": 5, "username": "User5", "vote_count": 15},
      {"option_id": 2, "user_id": 6, "username": "User6", "vote_count": 10},
      {"option_id": 3, "user_id": 7, "username": "User7", "vote_count": 20},
      {"option_id": 4, "user_id": 8, "username": "User8", "vote_count": 15},
    ],
  },
];
