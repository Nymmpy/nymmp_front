import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class GroupTap extends StatelessWidget {
  final int groupId;
  final String groupName;

  GroupTap({required this.groupId, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth; // 좌우 패딩을 고려한 최대 너비
        return Container(
          width: maxWidth,
          height: 125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color(0xffd9d9d9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    groupName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/poll',
                            arguments: groupId);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // 버튼 배경을 흰색으로 설정
                        minimumSize: Size(40, 40), // 버튼 크기 설정
                        side: BorderSide(
                            color: Colors.black, width: 1), // 얇은 검은색 테두리
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 모서리 반경 설정
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/VoteButton.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    SizedBox(height: 10), // 버튼 사이 간격
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/group',
                            arguments: groupId);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // 버튼 배경을 흰색으로 설정
                        minimumSize: Size(40, 40), // 버튼 크기 설정
                        side: BorderSide(
                            color: Colors.black, width: 1), // 얇은 검은색 테두리
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 모서리 반경 설정
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/ResultButton.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
