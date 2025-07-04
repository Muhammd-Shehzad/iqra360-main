import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iqra360/Model/Auth/login_view_model.dart';
import 'package:iqra360/Model/utils/CustomButton/custom_button.dart';
import 'package:iqra360/Model/utils/CustomDivider/custom_divider.dart';
import 'package:iqra360/Model/utils/CustomTextField/custom_text_field.dart';
import 'package:iqra360/Model/utils/CustomTextRich/custom_text_rich.dart';
import 'package:iqra360/Model/utils/SocialButton/social_button.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final logInViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D47A1).withOpacity(0.9), Color(0xFF1A237E)],
          ),
        ),
        child: Form(
          key: logInViewModel.formKey,
          child: Stack(
            children: [
              Positioned(
                bottom: -15.h,
                left: -10.w,
                right: -10.w,
                child: Image.asset(
                  'assets/splash3.png',
                  height: 200.h,
                  width: 300.w,
                ),
              ),
              Positioned(
                top: -250.h,
                right: -90.w,
                child: Image.asset('assets/backGroundImage.png'),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    Center(
                      child: Text(
                        'Login In'.tr,
                        style: TextStyle(
                          color: Color(0xFFd4d7ea),
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    customTextField(
                      controller: logInViewModel.emailController,
                      text: 'Email'.tr,
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.email,
                          color: Colors.cyanAccent,
                          size: 30.sp,
                        ),
                      ),
                      obsText: false,
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email'.tr;
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+'.tr);
                        if (!emailRegex.hasMatch(value)) {
                          return 'Enter a valid email'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    customTextField(
                      controller: logInViewModel.passwordController,
                      text: 'Password'.tr,
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.visibility,
                          color: Colors.cyanAccent,
                          size: 30.sp,
                        ),
                      ),
                      obsText: true,
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password'.tr;
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forgot Password?'.tr,
                          style: TextStyle(
                            color: Color(0xFFd4d7ea),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    CustomButton(
                      height: 50.h,
                      width: 325.w,
                      textColor: Colors.white,
                      color: Colors.cyanAccent,
                      text: 'LOGIN IN'.tr,
                      onPressed: () {
                        if (logInViewModel.formKey.currentState!.validate()) {
                          logInViewModel.logIn();
                        }
                      },
                    ),
                    SizedBox(height: 25.h),
                    CustomDivider(),
                    SizedBox(height: 20.h),
                    SocialButton(
                      text: 'Continue with Phone '.tr,
                      image: 'assets/phone.png',
                    ),
                    SizedBox(height: 20.h),
                    CustomTextRich(
                      text1: 'Do\'nt have an account? '.tr,
                      textSize1: 14.sp,
                      text2: 'Register'.tr,
                      textSize2: 14.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
