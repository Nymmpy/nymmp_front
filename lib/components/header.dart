import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isMyPage;

  Header({required this.isMyPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo.png', // 로고 이미지 경로 설정
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              if (isMyPage) {
                Navigator.pushNamed(context, '/main');
              } else {
                Navigator.pushNamed(context, '/mypage');
              }
            },
            child: Text(isMyPage ? 'Main Page' : 'My Page'),
          ),
        ],
      ),
    );
  }
}
