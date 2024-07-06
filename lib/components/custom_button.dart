import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black, // 배경색 검정
        borderRadius: BorderRadius.circular(4), // 둥근 모서리
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent, // 텍스트 색상
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // 패딩 조정
          elevation: 0, // 그림자 제거
          shape: RoundedRectangleBorder(
            // 모서리 둥글게 처리
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white, // 텍스트 색상 설정
          ),
        ),
      ),
    );
  }
}
