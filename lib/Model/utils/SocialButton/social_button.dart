import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final text;
  final image;
  const SocialButton({super.key, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text, style: TextStyle(color: Colors.grey, fontSize: 18.sp)),
          Image.asset(image, height: 30.h, width: 30.w, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
