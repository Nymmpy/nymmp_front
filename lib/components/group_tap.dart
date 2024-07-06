import "package:flutter/material.dart";

class GroupTap extends StatelessWidget {
  final int groupId;

  GroupTap({required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text('Group $groupId'),
    );
  }
}
