
import 'package:gez_toz/classes/ExpanseType.dart';
import 'package:gez_toz/other/money.dart';

class Expanse{
  static int FOOD_DRINK = 0, ACCOMODATION = 1, TRANSPORT = 2, ACTIVITY = 3;
  static List<ExpanseType> types = [
    ExpanseType(id: FOOD_DRINK, name: "Yeme & İçme"),
    ExpanseType(id: ACCOMODATION, name: "Konaklama"),
    ExpanseType(id: TRANSPORT, name: "Ulaşım"),
    ExpanseType(id: ACTIVITY, name: "Aktivite")
  ];

  static String getExpanseName(int id){
    for(int i=0; i<types.length; i++){
      if(id == types[i].id){
        return types[i].name;
      }
    }

    return "?_?";
  }


  String name;
  double amount;
  Money money;

  Expanse({ required this.name, required this.amount, required this.money });
}