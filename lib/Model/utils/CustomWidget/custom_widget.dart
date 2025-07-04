import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customWidget extends StatelessWidget {
  const customWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.white,
          child: Icon(Icons.apple, size: 30.sp, color: Colors.grey),
        ),
        SizedBox(width: 20.w),
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.white,
          child: Icon(Icons.facebook, size: 30.sp, color: Colors.blue),
        ),
      ],
    );
  }
}
