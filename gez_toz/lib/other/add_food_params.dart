
import 'package:gez_toz/classes/food.dart';

class AddFoodParams{
  List<Food> addedList;
  void Function(Food) addFood;

  AddFoodParams({
    required this.addedList, required this.addFood,
  });
}