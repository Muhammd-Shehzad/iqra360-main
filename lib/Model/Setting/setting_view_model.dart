import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/utils/Toast/toast_popup.dart';

import '../utils/Routes/routes_name.dart';

class SettingViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  void logOut() {
    auth
        .signOut()
        .then((v) {
          ToastPopup().toast('Sign Out Sccessfuly', Colors.green, Colors.white);
          Get.toNamed(RoutesName.Login);

          notifyListeners();
        })
        .onError((Error, v) {
          ToastPopup().toast(Error.toString(), Colors.red, Colors.white);
          notifyListeners();
        });
  }
}
