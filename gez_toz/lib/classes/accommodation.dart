import 'dart:core';

class Accommodation{

  static final int OWNED=0, RENTED=1, HOTEL=2,
      PENSION=3, CAPSULE_HOTEL=4, OUTDOORS=5;

  static final dict = {
    OWNED: Accommodation(id: OWNED, name: "Özel Mülk"),
    RENTED: Accommodation(id: OWNED, name: "Kiralık Mülk"),
    HOTEL: Accommodation(id: OWNED, name: "Otel"),
    PENSION: Accommodation(id: OWNED, name: "Pansiyon"),
    CAPSULE_HOTEL: Accommodation(id: OWNED, name: "Kapsül Otel"),
    OUTDOORS: Accommodation(id: OWNED, name: "Açık Hava"),
  };

  int id;
  String name;

  Accommodation({
    required this.id, required this.name,
  });
}