import 'package:flutter/material.dart';
import 'package:nymmp_front/components/custom_button.dart';

class PollPage extends StatefulWidget {
  final int pollId;
  final String questionText;

  PollPage({
    required this.pollId,
    required this.questionText,
  });

  @override
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  String? selectedOption;

  void _handleOptionSelect(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                widget.questionText,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 50),
              // 세 번째 요소: 2x2 버튼 배열
              Container(
                width: double.infinity,
                height: 200, // height를 약간 키움
                child: Padding(
                  padding: EdgeInsets.all(20.0), // 큰 사각형 밖에 패딩 추가
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: ElevatedButton(
                          onPressed: () => _handleOptionSelect('Option 1'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: selectedOption == 'Option 1'
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
                              "Option 1",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: selectedOption == 'Option 1'
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () => _handleOptionSelect('Option 2'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: selectedOption == 'Option 2'
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
                              "Option 2",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: selectedOption == 'Option 2'
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: ElevatedButton(
                          onPressed: () => _handleOptionSelect('Option 3'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: selectedOption == 'Option 3'
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
                              "Option 3",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: selectedOption == 'Option 3'
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () => _handleOptionSelect('Option 4'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: selectedOption == 'Option 4'
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
                              "Option 4",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: selectedOption == 'Option 4'
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                  SizedBox(height: 20),
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
