import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';

class SplashViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  void splashService() {
    final user = auth.currentUser;

    if (user != null) {
      Future.delayed(Duration(milliseconds: 5), () {
        Get.toNamed(RoutesName.HomeScreen);
      });
    } else {
      Future.delayed(Duration(seconds: 5), () {
        Get.toNamed(RoutesName.Login);
      });
    }
  }
}
