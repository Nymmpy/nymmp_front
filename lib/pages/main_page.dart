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
            GroupTap(groupId: 1, groupName: "MADCAMP 1"),
            SizedBox(height: 16),
            GroupTap(groupId: 2, groupName: "MADCAMP 2"),
          ],
        ),
      ),
    );
  }
}
