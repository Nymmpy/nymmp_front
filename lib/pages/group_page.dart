import 'package:flutter/material.dart';
import '../components/header.dart';

class GroupPage extends StatelessWidget {
  final int groupId;

  GroupPage({required this.groupId});

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
            Text('그룹 $groupId 페이지', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/poll', arguments: groupId);
              },
              child: Text('투표'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/result', arguments: groupId);
              },
              child: Text('결과 보기'),
            ),
          ],
        ),
      ),
    );
  }
}
