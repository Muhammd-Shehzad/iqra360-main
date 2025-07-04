import 'package:flutter/material.dart';

class CustomTextRich1 extends StatelessWidget {
  const CustomTextRich1({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.algText,
    this.sizetext1,
    this.sizetext2,
    this.sizetext3,
  });

  final text1;
  final text2;
  final text3;
  final sizetext1;
  final sizetext2;
  final sizetext3;
  final algText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyle(fontSize: sizetext1, color: Colors.white),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              fontSize: sizetext2,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: text3,
            style: TextStyle(
              fontSize: sizetext3,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
