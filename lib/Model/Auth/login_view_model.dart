import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';
import 'package:iqra360/Model/utils/Toast/toast_popup.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  void logIn() {
    auth
        .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
        .then((v) {
          ToastPopup().toast('Account Created', Colors.green, Colors.white);
          Get.toNamed(RoutesName.HomeScreen);
          emailController.clear();
          passwordController.clear();
          notifyListeners();
        })
        .onError((Error, v) {
          ToastPopup().toast(Error.toString(), Colors.red, Colors.white);
          notifyListeners();
        });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
