import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';

class HomeScreenViewModel extends ChangeNotifier {
  List<String> textKeys = [
    'Quran',
    'Duain',
    'Names',
    'Tasbeeh',
    'Quarnin Duain',
    'Qibla',
  ];
  List keys = ['Quran'.tr, 'Duain'.tr, 'Names'.tr, 'Tasbeeh'.tr, 'Quarnin Duain'.tr, 'Qibla'.tr];
  List images = [
    'assets/hafizatduain.png',
    'assets/dua1.png',
    'assets/names.png',
    'assets/tasbhih.png',
    'assets/quraniDuain.png',
    'assets/qiblaa.png',
  ];
  List images1 = ['assets/video2.png'];

  late final hijri;
  late final formatted;

  HomeScreenViewModel() {
    HijriCalendar.setLocal('ar');
    hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EE, d,MMM\nyyy ');
    formatted = format.format(day);
  }

  void listViewOnTapFun(int index) {
    switch (index) {
      case 0:
        Get.toNamed(RoutesName.QuranScreen, arguments: 0);
        break;
      case 1:
        Get.toNamed(RoutesName.DuainScreen, arguments: 2);
        break;
      case 2:
        Get.toNamed(RoutesName.Names, arguments: 1);
        break;
      case 3:
        Get.toNamed(RoutesName.TasbeehScreen, arguments: 3);
        break;
      default:
        Get.to(
          () => Scaffold(
            body: Center(
              child: Container(
                height: 100.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: Color(0xFF1A237E),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Center(
                  child: Text(
                    'No Route Found',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        break;
    }
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text("Select Language".tr),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Get.updateLocale(Locale('en_US'));
                    Get.back();
                  },
                  child: Container(
                    height: 50.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        'English'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    Get.updateLocale(Locale('ur_PK'));
                    Get.back();
                  },
                  child: Container(
                    height: 50.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        'Urdu'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
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
