import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  void showToast(String msg) {
    FlutterToast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
//      backgroundColor: Colors.grey[300],
//      textColor: Colors.black,
      backgroundColor: Colors.white30,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  void showToastInfo(String msg) {
    FlutterToast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[300],
      textColor: Colors.black,
//    backgroundColor: Colors.white30,
//    textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
