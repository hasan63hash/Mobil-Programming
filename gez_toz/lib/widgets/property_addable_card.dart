import "package:flutter/material.dart";
import 'package:gez_toz/widgets/property_card.dart';

class PropertyAddableCard extends StatefulWidget {
  String title;
  String addBtnTitle;
  Widget body;
  Widget addingForm;
  void Function() onAdd;

  PropertyAddableCard({
    required this.title, required this.body,
    required this.addBtnTitle, required this.addingForm,
    required this.onAdd,
  });

  @override
  _PropertyAddableCardState createState() => _PropertyAddableCardState();
}

class _PropertyAddableCardState extends State<PropertyAddableCard> {
  bool adding = false;

  void toggleAdding() {
    setState(() {
      adding = !adding;
    });
  }

  Widget footerButton(String title, void Function() onPressed, Color? color){
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: color
          ),
        ),
      ),
    );
  }

  Widget getBody(){
    if(adding){ // Ekleme görünümü
      return Column(
        children: [
          widget.body,
          widget.addingForm,
          Container(
            width: double.infinity,
            child: Row(
              children: [
                footerButton("Gizle", toggleAdding, Colors.red),
                footerButton("Ekle", widget.onAdd, null),
              ],
            ),
          )
        ],
      );
    }

    // Normal görünüm
    return Column(
      children: [
        widget.body,
        Container(
          width: double.infinity,
          child: TextButton(
            onPressed: toggleAdding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                Text(
                  widget.addBtnTitle,
                  style: TextStyle(
                      fontSize: 16
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PropertyCard(
      title: widget.title,
      child: getBody(),
    );
  }
}
