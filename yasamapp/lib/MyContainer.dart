import 'package:flutter/cupertino.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget child;


  MyContainer({required this.renk, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: renk,
        ),
      ),
    );
  }
}