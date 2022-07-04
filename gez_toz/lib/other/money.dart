
class Money{
  static Money tl = Money(id: 1, name: "Türk Lirası", shortName: "TL");
  static Money dollar = Money(id: 2, name: "Amerikan Doları", shortName: "\$");
  static Money euro = Money(id: 3, name: "Euro", shortName: "€");
  static List<Money> all = [
    tl, dollar, euro
  ];

  static Money getMoneyById(int id){
    if(id == tl.id){
      return tl;
    }
    else if(id == dollar.id){
      return dollar;
    }
    else {
      return euro;
    }
  }

  int id;
  String name;
  String shortName;

  Money({ required this.id, required this.name, required this.shortName });
}