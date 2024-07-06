import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class Header extends StatelessWidget {
  final bool isMyPage;

  Header({required this.isMyPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth), // 최대 너비를 500으로 설정
          decoration: BoxDecoration(
            color: Colors.white, // 헤더 배경색
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // 그림자 위치
              ),
            ],
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1, // 하단 테두리 두께
              ),
            ),
          ),
          child: SafeArea(
            child: Container(
              height: 70, // 헤더 높이 설정
              padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 패딩
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/NymmpLogo.png', // 로고 이미지 경로 설정
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
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, // 패딩을 없애서 버튼 크기를 이미지 크기와 일치시킴
                      backgroundColor: Colors.transparent, // 버튼 배경을 투명하게 설정
                      shadowColor: Colors.transparent, // 그림자 제거
                    ),
                    child: SvgPicture.asset(
                      'assets/profileImage.svg',
                      width: 52,
                      height: 52,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
