import "package:flutter/material.dart";
import 'package:gez_toz/classes/accommodation.dart';
import 'package:gez_toz/widgets/card_check_box.dart';
import 'package:gez_toz/widgets/property_card.dart';

class PostAccomodationCard extends StatefulWidget {

  Function setAccommodation;
  PostAccomodationCard({
    required this.setAccommodation
  });

  @override
  _PostAccomodationCardState createState() => _PostAccomodationCardState();
}

class _PostAccomodationCardState extends State<PostAccomodationCard> {
  List<Accommodation> accommodations = [];
  bool ownedProperty=false, rentedProperty=false, hotel=false,
    pension=false, capsule_hotel=false, outdoors=false;

  @override
  Widget build(BuildContext context) {
    return PropertyCard(
        title: "Konaklama",
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: CardCheckBox(
                    text: "Özel Mülk",
                    value: ownedProperty,
                    onChanged: (bool val){
                      setState(() {
                        if(val){ // ekle
                          accommodations.add(
                            Accommodation.dict[Accommodation.OWNED]!
                          );
                        }
                        else { // sil
                          accommodations.removeWhere((accommodation){
                            return accommodation.id == Accommodation.OWNED;
                          });
                        }
                        ownedProperty = val;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CardCheckBox(
                    text: "Kiralık Mülk",
                    value: rentedProperty,
                    onChanged: (bool val){
                      setState(() {
                        if(val){ // ekle
                          accommodations.add(
                              Accommodation.dict[Accommodation.RENTED]!
                          );
                        }
                        else { // sil
                          accommodations.removeWhere((accommodation){
                            return accommodation.id == Accommodation.RENTED;
                          });
                        }
                        rentedProperty = val;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: CardCheckBox(
                    text: "Otel",
                    value: hotel,
                    onChanged: (bool val){
                      setState(() {
                        if(val){ // ekle
                          accommodations.add(
                              Accommodation.dict[Accommodation.HOTEL]!
                          );
                        }
                        else { // sil
                          accommodations.removeWhere((accommodation){
                            return accommodation.id == Accommodation.HOTEL;
                          });
                        }
                        hotel = val;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CardCheckBox(
                    text: "Pansiyon",
                    value: pension,
                    onChanged: (bool val){
                      setState(() {
                        if(val){ // ekle
                          accommodations.add(
                              Accommodation.dict[Accommodation.HOTEL]!
                          );
                        }
                        else { // sil
                          accommodations.removeWhere((accommodation){
                            return accommodation.id == Accommodation.HOTEL;
                          });
                        }
                        pension = val;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: CardCheckBox(
                    text: "Kapsül Otel",
                    value: capsule_hotel,
                    onChanged: (bool val){
                      setState(() {
                        if(val){ // ekle
                          accommodations.add(
                              Accommodation.dict[Accommodation.CAPSULE_HOTEL]!
                          );
                        }
                        else { // sil
                          accommodations.removeWhere((accommodation){
                            return accommodation.id == Accommodation.CAPSULE_HOTEL;
                          });
                        }
                        capsule_hotel = val;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CardCheckBox(
                    text: "Açık hava",
                    value: outdoors,
                    onChanged: (bool val){
                      setState(() {
                        if(val){ // ekle
                          accommodations.add(
                              Accommodation.dict[Accommodation.OUTDOORS]!
                          );
                        }
                        else { // sil
                          accommodations.removeWhere((accommodation){
                            return accommodation.id == Accommodation.OUTDOORS;
                          });
                        }
                        outdoors = val;
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}
