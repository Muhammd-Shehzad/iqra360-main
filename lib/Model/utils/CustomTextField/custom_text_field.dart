import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
    this.text,
    this.icon,
    this.controller,
    this.val,
    this.obsText = false,
  });

  final text;
  final icon;
  final controller;
  final val;
  final obsText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: obsText,
        style: TextStyle(color: Colors.white, fontSize: 15.sp),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.white60, fontSize: 15.sp),
          suffixIcon: icon,

          filled: true,
          fillColor: Colors.white24,
          contentPadding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 17.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.cyanAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          errorStyle: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        validator: val,
      ),
    );
  }
}
