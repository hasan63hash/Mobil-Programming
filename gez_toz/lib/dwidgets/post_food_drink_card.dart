import 'package:flutter/material.dart';
import 'package:gez_toz/classes/food.dart';
import 'package:gez_toz/other/add_food_params.dart';
import 'package:gez_toz/widgets/property_card.dart';

class PostFoodDrinkCard extends StatefulWidget {

  Function setFood;

  PostFoodDrinkCard({ required this.setFood });

  @override
  _PostFoodDrinkCardState createState() => _PostFoodDrinkCardState();
}

class _PostFoodDrinkCardState extends State<PostFoodDrinkCard> {

  List<Food> addedList = [];

  void addFood(Food food){
    setState(() {
      addedList.add(food);
      widget.setFood(addedList);
    });
  }

  void removeFood(Food food){
    setState((){
      widget.setFood(addedList);
    });
  }

  List<Widget> getBody(){
    List<Widget> widgets = [];

    addedList.forEach((Food food) {
      widgets.add(
        Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: Text(food.name, overflow: TextOverflow.ellipsis)
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  removeFood(food);
                },
                icon: Icon(Icons.close, color: Colors.red),
              )
            ],
          ),
        )
      );
    });

    widgets.add(
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(
                "Yemek ekle",
                style: TextStyle(
                    fontSize: 16
                )
            ),
          ],
        ),
        onPressed: (){
          Navigator.of(context).pushNamed("/add_food_drink", arguments: AddFoodParams(
              addedList: addedList, addFood: addFood
          ));
        },
      )
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return PropertyCard(
        title: "Yemek & İçecek",
        child: Column(
          children: getBody(),
        )
    );
  }
}
