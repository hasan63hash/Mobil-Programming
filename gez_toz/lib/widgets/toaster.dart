import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster{

  void styledToast({ String? msg, Toast? length, Color? color, Color? textColor }){
    Fluttertoast.showToast(
        msg: msg!=null ? msg : "",
        toastLength: length!=null ? (length) : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: textColor,
        fontSize: 16.0
    );
  }
}