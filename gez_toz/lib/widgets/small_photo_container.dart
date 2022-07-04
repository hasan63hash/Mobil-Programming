import "package:flutter/material.dart";
import 'package:gez_toz/my_colors.dart';

class SmallPhotoContainer extends StatelessWidget {
  Widget child;
  SmallPhotoContainer({ required this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 120,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Color(MyColors.darkBlue),
              width: 2
          ),
          borderRadius: BorderRadius.circular(3)
      ),
      child: child,
    );
  }
}

