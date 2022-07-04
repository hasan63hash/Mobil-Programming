
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yasamapp/constants.dart';

class IconCinsiyet extends StatelessWidget {
  late final IconData icon;
  late final String data ;
  IconCinsiyet({required this.icon,required this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon,size: 50,color: Colors.black87,)
        ,SizedBox(height: 10,),Text(data,style: kMetinstili,)],

    );
  }
}