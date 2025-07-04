import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/Home/home_screen_view_model.dart';
import 'package:iqra360/Model/utils/AppBarIcon/app_bar_icon.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
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
              top: 30.h,
              right: 0.w,
              left: 0.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/16.png',
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/premium.png',
                            height: 20.h,
                            width: 20.w,
                            color: Colors.white,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppBarIcon(icon: Icons.search),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppBarIcon(icon: Icons.notifications),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppBarIcon(
                            icon: Icons.language,
                            onPressed: () {
                              homeScreenViewModel.showLanguageDialog(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppBarIcon(
                            icon: Icons.settings,
                            onPressed: () {
                              Get.toNamed(RoutesName.SettingScreen);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100.h,
              left: 0.w,
              right: 0.w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          image: DecorationImage(
                            image: AssetImage('assets/Media.jpeg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6),
                              BlendMode.darken,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF2196F3),
                              Color(0xFF2196F3).withOpacity(0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF1A237E),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${homeScreenViewModel.hijri.longMonthName.toString()},'
                                      '${homeScreenViewModel.hijri.hDay.toString()}\n'
                                      '${homeScreenViewModel.hijri.hYear.toString()} AH',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Now'.tr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          Text(
                                            'Magrab'.tr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Upcoming'.tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      Text(
                                        'Asha'.tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '4:44 Pm',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${homeScreenViewModel.formatted}'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 120.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF2196F3),
                            Color(0xFF2196F3).withOpacity(0.4),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF1A237E),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Opacity(
                              opacity: 0.3,
                              child: Image.asset(
                                'assets/splash3.png',
                                fit: BoxFit.cover,
                                height: 80.h,
                              ),
                            ),
                          ),

                          Positioned(
                            top: 15.h,
                            left: 0.w,
                            right: 0.w,
                            child: SizedBox(
                              height: 200.h,

                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeScreenViewModel.images.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 7.w,
                                    ),
                                    child: InkWell(
                                      onTap:
                                          () => homeScreenViewModel
                                              .listViewOnTapFun(index),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            homeScreenViewModel.images[index],
                                            color: Colors.white,
                                            height: 60.h,
                                            width: 60.w,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            homeScreenViewModel
                                                .textKeys[index]
                                                .tr,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 100.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF2196F3),
                            Color(0xFF2196F3).withOpacity(0.4),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF1A237E),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Opacity(
                              opacity: 0.3,
                              child: Image.asset(
                                'assets/splash3.png',
                                fit: BoxFit.cover,
                                height: 80.h,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/splash2.png',
                                height: 120.h,
                                width: 100.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sura Al Baqra'.tr,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'QS:Surah Al Baqra: Ayat 30'.tr,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25.sp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Videos'.tr,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.h,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.85,
                        aspectRatio: 16 / 9,
                        autoPlayInterval: Duration(seconds: 3),
                      ),
                      items:
                          homeScreenViewModel.images1.map((imagePath) {
                            return Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: Container(
                                    height: 100.h,
                                    width: 340.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF2196F3),
                                          Color(0xFF2196F3).withOpacity(0.4),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF1A237E),
                                          blurRadius: 20,
                                          spreadRadius: 2,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Opacity(
                                            opacity: 0.3,
                                            child: Image.asset(
                                              'assets/splash3.png',
                                              fit: BoxFit.cover,
                                              height: 80.h,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          imagePath,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
