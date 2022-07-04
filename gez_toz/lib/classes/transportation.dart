import 'dart:core';

class Transportation{

  static final int OWNED=0, RENTED=1, PUBLIC=2,
    AIR=3, SEA=4;

  static final dict = {
    OWNED: Transportation(id: OWNED, name:"Özel Araç"),
    RENTED: Transportation(id: RENTED, name:"Kiralık Araç"),
    PUBLIC: Transportation(id: PUBLIC, name:"Toplu Taşıma"),
    AIR: Transportation(id: AIR, name:"Hava Yolu"),
    SEA: Transportation(id: SEA, name:"Deniz Yolu"),
  };

  int id;
  String name;

  Transportation({
    required this.id, required this.name,
  });
}