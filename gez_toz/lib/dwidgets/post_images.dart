import 'dart:io';

import "package:flutter/material.dart";
import 'package:gez_toz/widgets/property_card.dart';
import 'package:gez_toz/widgets/small_photo_container.dart';
import '../my_colors.dart';
import 'package:image_picker/image_picker.dart';

class PostImagesCard extends StatefulWidget {

  Function setImageFiles;
  PostImagesCard({
    required this.setImageFiles
  });

  @override
  _PostImagesCardState createState() => _PostImagesCardState();
}

class _PostImagesCardState extends State<PostImagesCard> {
  final int maxPhotoCount = 5;
  List<XFile> _imageFiles = [];
  final ImagePicker _picker = ImagePicker();

  void addImage() async {
    if (_imageFiles.length < maxPhotoCount) { // Yeni resim al ve ekle
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery)
          .then((XFile? file) {
        setState(() {
          _imageFiles.add(file!);
          widget.setImageFiles(_imageFiles);
        });
      });
    }
    else { // Maksimum resim sayısına ulaşıldı. Ekleme
    }
  }

  List<Widget> getImageWidgets(){
    List<Widget> imageWidgets = [];

    // Fotoğraf ekleme butonu
    imageWidgets.add(
        SmallPhotoContainer(
          child: IconButton(
            onPressed: addImage,
            icon: Icon(Icons.add_a_photo, size: 30, color: Color(MyColors.blue)),
          ),
        )
    );

    // Eklenmiş olan fotoğraflar
    _imageFiles.forEach((XFile file){
      imageWidgets.add(
        SmallPhotoContainer(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: double.infinity,
                child: Image.file(
                  File(file.path),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      _imageFiles.remove(file);
                      widget.setImageFiles(_imageFiles);
                    });
                  },
                  icon: Icon(Icons.cancel, color: Colors.red),
                ),
              )
            ],
          ),
        )
      );
    });
    return imageWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return PropertyCard(
        title: "Fotoğraf(lar)",
        child: Container(
          height: 120,
          margin: EdgeInsets.only(left: 5),
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: getImageWidgets(),
          ),
        )
    );
  }
}
