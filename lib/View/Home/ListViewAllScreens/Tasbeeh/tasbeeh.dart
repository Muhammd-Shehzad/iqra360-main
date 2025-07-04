import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/ListViewAllScreens/tasbeeh_view_model.dart';
import 'package:provider/provider.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
  @override
  Widget build(BuildContext context) {
    final tasbeehViewModel = Provider.of<TasbeehViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1).withOpacity(0.9),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Tasbeeh'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
            Positioned(
              top: 10.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                height: 150.h, // Diameter of the circle
                width: 150.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0D47A1).withOpacity(0.2),
                      Color(0xFF1A237E),
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1A237E).withOpacity(0.1),
                      blurRadius: 1,
                      spreadRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Center(
                  child: Image.asset(
                    'assets/counter.png',
                    height: 100.h,
                    width: 100.w,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200.h,
              left: 0.w,
              right: 0.w,
              child: Image.asset(
                'assets/countericon.png',
                height: 200.h,
                width: 200.w,
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
            Positioned(
              //countButton
              top: 314.h,
              left: 7.w,
              right: 14.w,
              child: InkWell(
                onTap: () => tasbeehViewModel.incrementCounter(),
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 3,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              //Reset Button
              top: 285.h,
              left: -13.w,
              right: -90.w,
              child: InkWell(
                onTap: () => tasbeehViewModel.resetCounter(),
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230.h,
              left: 150,
              right: 157,
              child: Container(
                height: 40.h, // Diameter of the circle
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 1,
                  //     spreadRadius: 1,
                  //     offset: Offset(0, 4),
                  //   ),
                  // ],
                ),
                child: Center(
                  child: Text(
                    tasbeehViewModel.counter.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
