import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white54,
            thickness: 1,
            endIndent: 10.w,
            indent: 40.w,
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white54,
            thickness: 1,
            endIndent: 40.w,
            indent: 10.w,
          ),
        ),
      ],
    );
  }
}
