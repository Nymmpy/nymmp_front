import 'package:flutter/material.dart';
import '../components/group_tap.dart';
import '../components/header.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Header(isMyPage: false),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('참여 중인 그룹', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            GroupTap(groupId: 1),
            GroupTap(groupId: 2),
          ],
        ),
      ),
    );
  }
}
