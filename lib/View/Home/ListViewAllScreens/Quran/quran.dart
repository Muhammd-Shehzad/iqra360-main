import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/ListViewAllScreens/quran_view_Model.dart';

import 'package:provider/provider.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    final quranViewModel = Provider.of<QuranViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1).withOpacity(0.9),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Quran'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
              top: -30,
              left: 0,
              right: 0,
              child: Image.asset('assets/splash2.png', height: 200.h),
            ),
            Positioned(
              top: -1,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/star.png',
                height: 150.h,
                width: 100.w,
              ),
            ),
            Positioned(
              top: 170,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Container(
                      height: 450.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20.h,
                            left: 15.w,
                            right: 15.w,
                            child: Column(
                              children: [
                                Image.asset('assets/splash.png', height: 40.h),
                                SizedBox(
                                  height: 460.h,
                                  width: 340.w,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: quranViewModel.Data.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 18.h,
                                          crossAxisSpacing: 16.w,
                                          childAspectRatio: 1.3,
                                        ),
                                    padding: EdgeInsets.all(10.w),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap:
                                            () => quranViewModel
                                                .listViewOnTapFun(index),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16.r,
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF00C6FF),
                                                Color(0xFF0072FF),
                                              ],
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: -60,
                                                left: 0,
                                                right: 0,
                                                child: Image.asset(
                                                  'assets/splash2.png',
                                                  height: 200.h,
                                                  color: Colors.white
                                                      .withOpacity(0.1),
                                                  colorBlendMode:
                                                      BlendMode.modulate,
                                                ),
                                              ),
                                              Positioned(
                                                top: -1,
                                                left: 0,
                                                right: 0,
                                                child: Image.asset(
                                                  'assets/star.png',
                                                  height: 150.h,
                                                  width: 100.w,
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  colorBlendMode:
                                                      BlendMode.modulate,
                                                ),
                                              ),
                                              Positioned(
                                                top: 20.h,
                                                left: 16.w,
                                                right: 16.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      quranViewModel
                                                          .Data[index]['urdrName']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 25.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      quranViewModel
                                                          .Data[index]['engName']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white
                                                            .withOpacity(0.9),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
