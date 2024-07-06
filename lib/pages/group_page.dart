import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/header.dart';

class GroupPage extends StatelessWidget {
  final int groupId;
  final String goldMedalUser;
  final String silverMedalUser;
  final String bronzeMedalUser;

  GroupPage({
    required this.groupId,
    required this.goldMedalUser,
    required this.silverMedalUser,
    required this.bronzeMedalUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Header(isMyPage: false),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 414), // 최대 너비를 414로 설정
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(-4, 0), // 왼쪽 그림자
                blurRadius: 4,
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(4, 0), // 오른쪽 그림자
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  'MadCamp 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'PatrickHand',
                      fontSize: 70,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0), // 좌우 패딩 추가
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/goldmedal.svg',
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        goldMedalUser,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0), // 좌우 패딩 추가
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: SvgPicture.asset(
                        'assets/silvermedal.svg',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        silverMedalUser,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0), // 좌우 패딩 추가
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SvgPicture.asset(
                        'assets/bronzemedal.svg',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        bronzeMedalUser,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
