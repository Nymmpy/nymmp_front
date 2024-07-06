import 'package:flutter/material.dart';

class PollPage extends StatelessWidget {
  final int pollId;
  final String questionText;

  PollPage({
    required this.pollId,
    required this.questionText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('투표 $pollId')),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 414), // 최대 너비를 414로 설정
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(-4, 0), // 왼쪽 그림자
                blurRadius: 4,
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(4, 0), // 오른쪽 그림자
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 첫 번째 요소: 랜덤 이미지
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'Random Image',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // 두 번째 요소: 질문 텍스트
              Text(
                questionText,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              // 세 번째 요소: 2x2 버튼 배열
              Container(
                padding: EdgeInsets.all(20.0), // 큰 사각형 밖에 패딩 추가
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 116,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Option 1",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 116,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Option 2",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 116,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Option 3",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 116,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Option 4",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // 네 번째 요소: Skip 및 Shuffle 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Skip"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Shuffle"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
