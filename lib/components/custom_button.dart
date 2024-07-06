import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // 버튼 배경 투명 처리
        shadowColor: Colors.transparent, // 그림자 제거
        padding: EdgeInsets.zero, // 내부 패딩 제거
      ),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300], // 기본 배경 색상
          borderRadius: BorderRadius.circular(8), // 둥근 모서리
        ),
        child: Stack(
          children: [
            Positioned(
              left: 2,
              top: 2,
              child: Container(
                width: 2.5,
                height: 2.5,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: Container(
                width: 7.5,
                height: 7.5,
                color: Colors.green,
              ),
            ),
            Positioned(
              left: 13,
              top: 13,
              child: Container(
                width: 12.5,
                height: 12.5,
                color: Colors.blue,
              ),
            ),
            Center(child: Text(text, style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
