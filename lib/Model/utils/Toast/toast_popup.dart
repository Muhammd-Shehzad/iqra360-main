import 'package:fluttertoast/fluttertoast.dart';

class ToastPopup {
  void toast(message, backGroundColor, textColor) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: backGroundColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
    );
  }
}
