import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';

class QuranViewModel extends ChangeNotifier {
  List<Map<dynamic, dynamic>> Data = [
    {'urdrName': 'سورة', 'engName': 'Surah'},
    {'urdrName': 'جزء', 'engName': 'Juz'},
  ];

  void listViewOnTapFun(int index) {
    switch (index) {
      case 0:
        Get.toNamed(RoutesName.QariListScreen, arguments: 0);
        break;
      case 1:
        Get.toNamed(RoutesName.JuzScreen, arguments: 1);
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
}
