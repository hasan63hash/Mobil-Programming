import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {

  Color bg, border;
  CarouselIndicator({required this.bg, required this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
          color: bg,
          border: Border.all(color: border, width: 1),
          borderRadius: BorderRadius.circular(25)
      ),
    );
  }
}
