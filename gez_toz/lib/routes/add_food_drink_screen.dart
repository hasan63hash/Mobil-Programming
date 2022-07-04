
import "package:flutter/material.dart";
import 'package:gez_toz/classes/food.dart';
import 'package:gez_toz/other/add_food_params.dart';
import 'package:gez_toz/widgets/food_drink_card.dart';
import 'package:gez_toz/widgets/standard_app_bar.dart';

class AddFoodDrinkScreen extends StatefulWidget {

  @override
  _AddFoodDrinkScreenState createState() => _AddFoodDrinkScreenState();
}

class _AddFoodDrinkScreenState extends State<AddFoodDrinkScreen> {

  late void Function(Food) addFood;
  List<Food> addedList = [];

  List<Food> foodsAndDrinks = [
    Food(id: 1, name: "Mücver"),
    Food(id: 2, name: "Adana Kebap"),
    Food(id: 3, name: "Kola"),
    Food(id: 4, name: "Guatemala Kahvesi"),
  ];

  bool doesExist(List<Food> list, Food food){
    return list.indexWhere((element) => food.id == element.id) >= 0;
  }

  List<Widget> getFoodDrinkWidgets(){
    List<Widget> widgets = [];

    // Yiyecek ve içecek kartları
    foodsAndDrinks.forEach((Food food) {
      widgets.add(
        FoodDrinkCard(
          food: food, isSelected: doesExist(addedList, food),
          add: addFood, addedList: addedList
        )
      );
    });

    return widgets;
  }

  PreferredSizeWidget getAppBar(){
    return StandardAppBar(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Yemek, içecek, tatlı...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search, color: Colors.black, size: 30,)
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AddFoodParams params = ModalRoute.of(context)!.settings.arguments as AddFoodParams;
    addFood = params.addFood;
    addedList = params.addedList;


    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 15),
            Column(
              children: getFoodDrinkWidgets(),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
