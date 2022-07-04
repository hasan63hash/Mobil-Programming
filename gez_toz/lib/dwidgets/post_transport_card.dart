import "package:flutter/material.dart";
import 'package:gez_toz/classes/transportation.dart';
import 'package:gez_toz/widgets/card_check_box.dart';
import 'package:gez_toz/widgets/property_card.dart';

class PostTransportCard extends StatefulWidget {

  Function setTransports;

  PostTransportCard({ required this.setTransports });

  @override
  _PostTransportCardState createState() => _PostTransportCardState();
}

class _PostTransportCardState extends State<PostTransportCard> {
  List<Transportation> transports = [];
  bool ownedTransport=false, rentedTransport=false, publicTransport=false,
      airway=false, seaway=false;

  @override
  Widget build(BuildContext context) {
    return PropertyCard(
        title: "Ulaşım",
        child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex:1,
                      child: CardCheckBox(
                        text: "Özel Araç",
                        value: ownedTransport,
                        onChanged: (bool val){
                          setState(() {
                            if(val){ // ekle
                              ownedTransport = true;
                              transports.add(
                                  Transportation.dict[Transportation.OWNED]!
                              );
                            }
                            else{ // sil
                              ownedTransport = false;
                              transports.removeWhere((transport) => transport.id == Transportation.OWNED);
                            }
                            widget.setTransports(transports);
                          });
                        },
                      ),
                  ),
                  Expanded(
                      flex: 1,
                      child: CardCheckBox(
                        text: "Kiralık Araç",
                        value: rentedTransport,
                        onChanged: (bool val){
                          setState(() {
                            if(val){ // ekle
                              rentedTransport = true;
                              transports.add(
                                  Transportation.dict[Transportation.RENTED]!
                              );
                            }
                            else{ // sil
                              rentedTransport = false;
                              transports.removeWhere((transport) => transport.id == Transportation.RENTED);
                            }
                            widget.setTransports(transports);
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
                      text: "Toplu Taşıma",
                      value: publicTransport,
                      onChanged: (bool val){
                        setState(() {
                          if(val){ // ekle
                            publicTransport = true;
                            transports.add(
                                Transportation.dict[Transportation.PUBLIC]!
                            );
                          }
                          else{ // sil
                            publicTransport = false;
                            transports.removeWhere((transport) => transport.id == Transportation.PUBLIC);
                          }
                          widget.setTransports(transports);
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CardCheckBox(
                      text: "Hava Yolu",
                      value: airway,
                      onChanged: (bool val){
                        setState(() {
                          if(val){ // ekle
                            airway = true;
                            transports.add(
                                Transportation.dict[Transportation.AIR]!
                            );
                          }
                          else{ // sil
                            airway = false;
                            transports.removeWhere((transport) => transport.id == Transportation.AIR);
                          }
                          widget.setTransports(transports);
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
                      text: "Deniz Yolu",
                      value: seaway,
                      onChanged: (bool val) {
                        setState(() {
                          if(val){ // ekle
                            seaway = true;
                            transports.add(
                                Transportation.dict[Transportation.SEA]!
                            );
                          }
                          else{ // sil
                            seaway = false;
                            transports.removeWhere((transport) => transport.id == Transportation.SEA);
                          }
                          widget.setTransports(transports);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
