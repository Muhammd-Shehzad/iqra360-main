import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra360/Model/SplahScreen/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

SplashViewModel sp = SplashViewModel();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    sp.splashService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Positioned(
              top: 250.h,
              left: 20.w,
              right: 20.w,
              child: Image.asset(
                'assets/iqra360.png',
                height: 150.h,
                fit: BoxFit.contain,
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
