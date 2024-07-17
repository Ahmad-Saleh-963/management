


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToastHelper{

  static void show(String message,ToastType toastType){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor : toastType == ToastType.error ? Colors.red : toastType == ToastType.success ? Colors.green : Colors.yellow,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

}

enum ToastType{
  error,
  success,
  warning,
  info,
}