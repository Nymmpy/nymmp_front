import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  final String groupId;

  GroupPage({required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('그룹 $groupId 페이지')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('그룹 $groupId 페이지', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/vote');
              },
              child: Text('투표'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/result/$groupId');
              },
              child: Text('결과 보기'),
            ),
          ],
        ),
      ),
    );
  }
}
