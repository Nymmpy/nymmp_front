import 'package:flutter/material.dart';

class PollPage extends StatelessWidget {
  final int pollId;

  PollPage({required this.pollId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('투표 $pollId')),
      body: Center(
        child: Text('투표 $pollId', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
