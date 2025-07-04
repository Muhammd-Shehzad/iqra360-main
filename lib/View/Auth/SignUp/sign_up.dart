import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/Auth/sign_up_view_model.dart';
import 'package:iqra360/Model/utils/CustomButton/custom_button.dart';
import 'package:iqra360/Model/utils/CustomDivider/custom_divider.dart';
import 'package:iqra360/Model/utils/CustomTextField/custom_text_field.dart';
import 'package:iqra360/Model/utils/SocialButton/social_button.dart';

import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);

    return Scaffold(
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D47A1).withOpacity(0.9), // Slightly lighter blue
              Color(0xFF1A237E), // Dark blue
            ],
          ),
        ),
        child: Form(
          key: signUpViewModel.formKey,
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
                  children: [
                    SizedBox(height: 50.h),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Sign Up'.tr,
                        style: TextStyle(
                          color: Color(0xFFd4d7ea),
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    customTextField(
                      controller: signUpViewModel.emailController,
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
                      controller: signUpViewModel.passwordController,
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
                    SizedBox(height: 20.h),
                    customTextField(
                      controller: signUpViewModel.confirmPasswordController,
                      text: 'Confirm Password'.tr,
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
                          return 'Please enter your confirm password'.tr;
                        } else if (value.length < 6) {
                          return 'Confirm password must be at least 6 characters'.tr;
                        } else if (value !=
                            signUpViewModel.passwordController.text) {
                          return 'Passwords do not match'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      height: 50.h,
                      width: 325.w,
                      textColor: Colors.white,
                      color: Colors.cyanAccent,
                      text: 'SIGN UP'.tr,
                      onPressed: () {
                        if (signUpViewModel.formKey.currentState!.validate()) {
                          signUpViewModel.signUp();
                        }
                      },
                    ),

                    SizedBox(height: 25.h),
                    CustomDivider(),
                    SizedBox(height: 20.h),
                    SocialButton(
                      text: 'Continue with Phone'.tr,
                      image: 'assets/phone.png',
                    ),
                    SizedBox(height: 20.h),
                    SocialButton(
                      text: 'Continue with Gmail'.tr,
                      image: 'assets/gmail.png'.tr,
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
