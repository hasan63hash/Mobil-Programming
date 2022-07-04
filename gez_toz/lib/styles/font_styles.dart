
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gez_toz/my_colors.dart';

class FontStyles {

  static grayText(double fontSize){
    return TextStyle(
      color: Color(MyColors.gray),
      fontSize: fontSize,
    );
  }

  static darkBlueText(double fontSize) {
    return TextStyle(
      color: Color(MyColors.darkBlue),
      fontSize: fontSize,
    );
  }

  static blackText(double fontSize){
    return TextStyle(
      color: Colors.black,
      fontSize: fontSize,
    );
  }
}