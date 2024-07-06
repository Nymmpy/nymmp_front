import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String groupId;

  const ResultPage({required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('그룹 $groupId 결과 페이지')),
      body: Center(
        child: Text('그룹 $groupId 결과 페이지', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
