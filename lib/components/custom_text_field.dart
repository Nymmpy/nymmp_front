import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;

  CustomTextField({
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 12), // Consistent spacing between fields
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          SizedBox(height: 8),
          Container(
            width: 250, // Matching width with CustomButton
            height: 50, // Matching height with CustomButton
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                  borderSide:
                      BorderSide(color: Colors.black, width: 1), // Border style
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12), // Inner padding to match button
                filled: true,
                fillColor: Colors.white, // Background color
              ),
              style: TextStyle(
                fontSize: 22, // Font size matching button text
                color: Colors.black, // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
