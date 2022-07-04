
import "package:flutter/material.dart";
import 'package:gez_toz/classes/food.dart';

class FoodDrinkCard extends StatefulWidget {
  Food food;
  bool isSelected;
  void Function(Food) add;
  List<Food> addedList;

  FoodDrinkCard({
    required this.food, required this.isSelected,
    required this.add, required this.addedList
  });

  @override
  _FoodDrinkCardState createState() => _FoodDrinkCardState();
}

class _FoodDrinkCardState extends State<FoodDrinkCard> {

  Color getTextColor(){
    if(widget.isSelected){
      return Colors.white;
    }

    return Colors.black;
  }

  Color getBodyColor(){
    if(widget.isSelected){
      return Colors.blue;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(!widget.isSelected){ // Seçili değilse, seç ve ekle
            widget.add(widget.food);
            widget.isSelected = true;
          }
        });
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: EdgeInsets.only(left: 10, right: 10),
        height: 45,
        decoration: BoxDecoration(
            color: getBodyColor(),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ]
        ),
        child: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text(
            widget.food.name,
            style: TextStyle(
              fontSize: 20,
              color: getTextColor(),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ),
    );
  }
}
