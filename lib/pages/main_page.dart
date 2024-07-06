import 'package:flutter/material.dart';
import '../components/group_tap.dart';
import '../components/header.dart';
import '../constants.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // 헤더 높이를 좀 더 늘림
        child: Header(isMyPage: false),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth), // 최대 너비를 600으로 설정
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
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GroupTap(groupId: 1, groupName: "MADCAMP 1"),
              SizedBox(height: 16),
              GroupTap(groupId: 2, groupName: "MADCAMP 2"),
            ],
          ),
        ),
      ),
    );
  }
}
