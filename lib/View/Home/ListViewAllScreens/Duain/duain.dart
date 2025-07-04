import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/ListViewAllScreens/duain_view_model.dart';
import 'package:iqra360/Model/utils/CustomTextRich/custom_text_rich.dart';

import 'package:provider/provider.dart';

class Duain extends StatefulWidget {
  const Duain({super.key});

  @override
  State<Duain> createState() => _DuainState();
}

class _DuainState extends State<Duain> {
  @override
  Widget build(BuildContext context) {
    final duainViewModel = Provider.of<DuainViewModel>(context);
    return Directionality(
      textDirection:
          duainViewModel.isUrdu ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0D47A1).withOpacity(0.9),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          title: Text(
            'Duain'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily:
                  duainViewModel.isUrdu
                      ? 'JameelNoori'
                      : null, // Optional custom font
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
              // background images
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: duainViewModel.duaData.length,
                        itemBuilder: (context, index) {
                          final dua = duainViewModel.duaData[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF1A237E),
                                    blurRadius: 10,
                                    spreadRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment:
                                        duainViewModel.isUrdu
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    child: Text(
                                      '${index + 1} # ${dua['title']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            duainViewModel.isUrdu
                                                ? 'JameelNoori'
                                                : null,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    dua['dua'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          duainViewModel.isUrdu
                                              ? 'JameelNoori'
                                              : null,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  CustomTextRich(
                                    text1: 'Translation: '.tr,
                                    text2: dua['tra'],
                                    textSize1: 18.sp,
                                    textSize2: 15.sp,
                                  ),
                                  CustomTextRich(
                                    text1: 'Reference: '.tr,
                                    text2: dua['ref'],
                                    textSize1: 14.sp,
                                    textSize2: 12.sp,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
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
