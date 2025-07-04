import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';
import 'package:iqra360/Model/utils/Toast/toast_popup.dart';

class SignUpViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final db = FirebaseFirestore.instance.collection('user');
  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  void signUp() {
    auth.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    db
        .doc(id)
        .set({id: id, 'email': emailController.text.toString()})
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
    confirmPasswordController.dispose();
    super.dispose();
  }
}
