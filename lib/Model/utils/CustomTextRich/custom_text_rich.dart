import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    this.text1,
    this.text2,
    this.textSize1,
    this.textSize2,
  });
  final text1;
  final text2;
  final textSize1;
  final textSize2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: TextStyle(
                  fontSize: textSize1,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: textSize2,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(RoutesName.SignUp);
                      },
              ),
            ],
          ),

          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
