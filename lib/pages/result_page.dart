import 'package:flutter/material.dart';
import '../components/header.dart';

class ResultPage extends StatelessWidget {
  final int groupId;

  ResultPage({required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Header(isMyPage: false),
      ),
      body: Center(
        child: Text('그룹 $groupId 결과 페이지', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
