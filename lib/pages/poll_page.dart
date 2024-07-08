import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nymmp_front/components/custom_button.dart';
import 'package:go_router/go_router.dart';

class PollPage extends StatelessWidget {
  final int pollId;
  final String questionText;
  final List<Map<String, dynamic>> options;
  final int totalCount;

  PollPage({
    required this.pollId,
    required this.questionText,
    required this.options,
    required this.totalCount,
  });

  @override
<<<<<<< Updated upstream
=======
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  String? selectedOption;

  void _handleOptionSelect(String option) {
    setState(() {
      selectedOption = option;
    });

    // 3초 후에 다음 PollPage로 이동
    Timer(Duration(seconds: 3), () {
      int nextPollId = widget.pollId % 12 + 1; // 1부터 12까지 순환
      context.go('/poll/$nextPollId');
    });
  }

  @override
>>>>>>> Stashed changes
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('투표 $pollId')),
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
          padding: EdgeInsets.symmetric(horizontal: 20.0), // 좌우 패딩 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100), // 상단 여백 추가
              // 첫 번째 요소: 랜덤 이미지
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                margin: EdgeInsets.only(top: 20.0), // 상단 마진 추가
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
              SizedBox(height: 50),
              // 세 번째 요소: 2x2 버튼 배열
              Container(
                width: double.infinity,
                height: 180,
                child: Padding(
                  padding: EdgeInsets.all(20.0), // 큰 사각형 밖에 패딩 추가
                  child: Stack(
<<<<<<< Updated upstream
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 116,
                          height: 50,
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
=======
                    children: widget.options.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, dynamic> option = entry.value;
                      int optionId = option['option_id'];
                      String username = option['username'];
                      int voteCount = option['vote_count'];
                      double percentage = selectedOption == optionId.toString()
                          ? (voteCount + 1) / (widget.totalCount + 1)
                          : voteCount / (widget.totalCount + 1);

                      return Positioned(
                        top: index < 2 ? 0 : null,
                        bottom: index >= 2 ? 0 : null,
                        left: index % 2 == 0 ? 0 : null,
                        right: index % 2 != 0 ? 0 : null,
                        child: Container(
                          width: 130,
                          height: 70,
                          child: Stack(
                            children: [
                              Container(
                                width: 130 * percentage,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
>>>>>>> Stashed changes
                              ),
                              ElevatedButton(
                                onPressed: () => _handleOptionSelect(optionId.toString()),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  side: BorderSide(
                                    color: selectedOption == optionId.toString()
                                        ? Colors.grey
                                        : Colors.black,
                                    width: 4, // 테두리를 두껍게 설정
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: Size(130, 70), // 버튼 크기를 키움
                                ),
                                child: Center(
                                  child: Text(
                                    username,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: selectedOption == optionId.toString()
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
<<<<<<< Updated upstream
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 116,
                          height: 50,
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
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 116,
                          height: 50,
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 116,
                          height: 50,
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
=======
                      );
                    }).toList(),
>>>>>>> Stashed changes
                  ),
                ),
              ),
              SizedBox(height: 20),
              // 네 번째 요소: Skip 및 Shuffle 버튼
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed: () {},
                    text: "Shuffle",
                  ),
                  SizedBox(height: 20,),
                  CustomButton(
                    onPressed: () {},
                    text: "Skip",
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
// Dummy poll data
List<Map<String, dynamic>> pollData = [
  {
    "poll_id": 1,
    "question": "Which sports are you interested in playing?",
    "total_count": 100,
    "options": [
      {"option_id": 1, "user_id": 1, "username": "User1", "vote_count": 10},
      {"option_id": 2, "user_id": 2, "username": "User2", "vote_count": 20},
      {"option_id": 3, "user_id": 3, "username": "User3", "vote_count": 30},
      {"option_id": 4, "user_id": 4, "username": "User4", "vote_count": 40},
    ],
  },
  {
    "poll_id": 2,
    "question": "What is your favorite color?",
    "total_count": 80,
    "options": [
      {"option_id": 1, "user_id": 5, "username": "User5", "vote_count": 10},
      {"option_id": 2, "user_id": 6, "username": "User6", "vote_count": 20},
      {"option_id": 3, "user_id": 7, "username": "User7", "vote_count": 25},
      {"option_id": 4, "user_id": 8, "username": "User8", "vote_count": 25},
    ],
  },
  {
    "poll_id": 3,
    "question": "What is your favorite food?",
    "total_count": 90,
    "options": [
      {"option_id": 1, "user_id": 9, "username": "User9", "vote_count": 15},
      {"option_id": 2, "user_id": 10, "username": "User10", "vote_count": 25},
      {"option_id": 3, "user_id": 11, "username": "User11", "vote_count": 20},
      {"option_id": 4, "user_id": 12, "username": "User12", "vote_count": 30},
    ],
  },
  {
    "poll_id": 4,
    "question": "Which city do you want to visit?",
    "total_count": 70,
    "options": [
      {"option_id": 1, "user_id": 13, "username": "User13", "vote_count": 15},
      {"option_id": 2, "user_id": 14, "username": "User14", "vote_count": 10},
      {"option_id": 3, "user_id": 15, "username": "User15", "vote_count": 20},
      {"option_id": 4, "user_id": 16, "username": "User16", "vote_count": 25},
    ],
  },
  {
    "poll_id": 5,
    "question": "What is your favorite movie genre?",
    "total_count": 110,
    "options": [
      {"option_id": 1, "user_id": 17, "username": "User17", "vote_count": 30},
      {"option_id": 2, "user_id": 18, "username": "User18", "vote_count": 20},
      {"option_id": 3, "user_id": 19, "username": "User19", "vote_count": 40},
      {"option_id": 4, "user_id": 20, "username": "User20", "vote_count": 20},
    ],
  },
  {
    "poll_id": 6,
    "question": "Which season do you like the most?",
    "total_count": 90,
    "options": [
      {"option_id": 1, "user_id": 1, "username": "User1", "vote_count": 25},
      {"option_id": 2, "user_id": 2, "username": "User2", "vote_count": 20},
      {"option_id": 3, "user_id": 3, "username": "User3", "vote_count": 30},
      {"option_id": 4, "user_id": 4, "username": "User4", "vote_count": 15},
    ],
  },
  {
    "poll_id": 7,
    "question": "What is your favorite animal?",
    "total_count": 95,
    "options": [
      {"option_id": 1, "user_id": 5, "username": "User5", "vote_count": 20},
      {"option_id": 2, "user_id": 6, "username": "User6", "vote_count": 25},
      {"option_id": 3, "user_id": 7, "username": "User7", "vote_count": 30},
      {"option_id": 4, "user_id": 8, "username": "User8", "vote_count": 20},
    ],
  },
  {
    "poll_id": 8,
    "question": "What is your favorite music genre?",
    "total_count": 85,
    "options": [
      {"option_id": 1, "user_id": 9, "username": "User9", "vote_count": 15},
      {"option_id": 2, "user_id": 10, "username": "User10", "vote_count": 30},
      {"option_id": 3, "user_id": 11, "username": "User11", "vote_count": 20},
      {"option_id": 4, "user_id": 12, "username": "User12", "vote_count": 20},
    ],
  },
  {
    "poll_id": 9,
    "question": "What is your favorite book genre?",
    "total_count": 75,
    "options": [
      {"option_id": 1, "user_id": 13, "username": "User13", "vote_count": 20},
      {"option_id": 2, "user_id": 14, "username": "User14", "vote_count": 10},
      {"option_id": 3, "user_id": 15, "username": "User15", "vote_count": 25},
      {"option_id": 4, "user_id": 16, "username": "User16", "vote_count": 20},
    ],
  },
  {
    "poll_id": 10,
    "question": "What is your favorite hobby?",
    "total_count": 65,
    "options": [
      {"option_id": 1, "user_id": 17, "username": "User17", "vote_count": 15},
      {"option_id": 2, "user_id": 18, "username": "User18", "vote_count": 20},
      {"option_id": 3, "user_id": 19, "username": "User19", "vote_count": 10},
      {"option_id": 4, "user_id": 20, "username": "User20", "vote_count": 20},
    ],
  },
  {
    "poll_id": 11,
    "question": "What is your favorite holiday destination?",
    "total_count": 70,
    "options": [
      {"option_id": 1, "user_id": 1, "username": "User1", "vote_count": 20},
      {"option_id": 2, "user_id": 2, "username": "User2", "vote_count": 15},
      {"option_id": 3, "user_id": 3, "username": "User3", "vote_count": 25},
      {"option_id": 4, "user_id": 4, "username": "User4", "vote_count": 10},
    ],
  },
  {
    "poll_id": 12,
    "question": "What is your favorite drink?",
    "total_count": 60,
    "options": [
      {"option_id": 1, "user_id": 5, "username": "User5", "vote_count": 15},
      {"option_id": 2, "user_id": 6, "username": "User6", "vote_count": 10},
      {"option_id": 3, "user_id": 7, "username": "User7", "vote_count": 20},
      {"option_id": 4, "user_id": 8, "username": "User8", "vote_count": 15},
    ],
  },
];
