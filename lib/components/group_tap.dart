import 'package:flutter/material.dart';

class GroupTap extends StatelessWidget {
  final int groupId;

  GroupTap({required this.groupId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/group', arguments: groupId);
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('Group $groupId'),
      ),
    );
  }
}
