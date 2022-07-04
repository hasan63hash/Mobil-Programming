import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyImagePicker extends StatefulWidget {
  String imagePath = "";
  MyImagePicker({ required this.imagePath });

  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  Widget noImageChosen() {
    return Container(
      constraints: BoxConstraints(
        minHeight: 40,
      ),
      child: Center(
        child: Text(
          "Resim Seçilmedi",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget imageChosen() {
    return Container(
        constraints: BoxConstraints(
          maxHeight: 250,
        ),
        child: Image.file(File(widget.imagePath))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: widget.imagePath.isNotEmpty ? imageChosen() : noImageChosen(),
    );
  }
}
