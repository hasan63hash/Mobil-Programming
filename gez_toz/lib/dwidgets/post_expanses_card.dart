import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:gez_toz/classes/Expanse.dart';
import 'package:gez_toz/classes/ExpanseType.dart';
import 'package:gez_toz/other/money.dart';
import 'package:gez_toz/widgets/property_addable_card.dart';

class PostExpansesCard extends StatefulWidget {

  Function setExpanses;

  PostExpansesCard({
    required this.setExpanses,
  });

  @override
  _PostExpansesCardState createState() => _PostExpansesCardState();
}

class _PostExpansesCardState extends State<PostExpansesCard> {
  List<Expanse> expanses = [];
  int currency = Money.tl.id;
  int expanseType = Expanse.types[0].id;
  double amount = 0.0;
  TextEditingController txtController = TextEditingController();

  void resetValues(){
    setState(() {
      currency =  Money.tl.id;
      expanseType = Expanse.types[0].id;
      amount = 0.0;
      txtController.clear();
    });
  }

  void addExpanse(){
    if(amount != 0){
      setState(() {
        Expanse expanse = Expanse(
          name: Expanse.getExpanseName(expanseType),
          amount: amount,
          money: Money.getMoneyById(currency),
        );
        expanses.add(expanse);
        widget.setExpanses(expanses);
        resetValues();
      });
    }
  }

  void removeExpanse(Expanse expanse){
    setState(() {
      expanses.remove(expanse);
      widget.setExpanses(expanses);
    });
  }

  Widget getBody(){
    return Column(
      children: expanses.map((expanse) => Container(
        padding: EdgeInsets.only(left: 5),
        width: double.infinity,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(expanse.name),
            Row(
              children: [
                Text(expanse.amount.toString()),
                Text(expanse.money.shortName),
                Container(
                  child: IconButton(
                    onPressed: (){
                      removeExpanse(expanse);
                    },
                    icon: Icon( Icons.close, color: Colors.red),
                    padding: EdgeInsets.zero,
                  ),
                )
              ],
            )
          ],
        ),
      )).toList(),
    );
  }

  Widget getForm() {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          DropdownButton<int>(
            value: expanseType,
            items: Expanse.types
                .map<DropdownMenuItem<int>>((ExpanseType type) {
              return DropdownMenuItem<int>(
                value: type.id,
                child: Text(type.name),
              );
            }).toList(),
            onChanged: (int? newValue) => {
              setState((){
                expanseType = newValue!;
              })
            },
            underline: SizedBox(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: txtController,
                  decoration: InputDecoration(
                      labelText: "Harcama miktarı...",
                      contentPadding: EdgeInsets.zero
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                  ],
                  onChanged: (String value) {
                    try{
                      amount = double.parse(value);
                    }catch(e) {
                      log("Girilen değer sayı değil!");
                      amount = 0.0;
                    }
                  },
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: DropdownButton<int>(
                  value: currency,
                  items: Money.all
                      .map<DropdownMenuItem<int>>((Money money) {
                    return DropdownMenuItem<int>(
                      value: money.id,
                      child: Text(money.shortName),
                    );
                  }).toList(),
                  onChanged: (int? newValue) => {
                    setState((){
                      currency = newValue!;
                    })
                  },
                  underline: SizedBox(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PropertyAddableCard(
      title: "Harcama(lar)",
      body: getBody(),
      addBtnTitle: "Harcama Ekle",
      addingForm: getForm(),
      onAdd: addExpanse,
    );
  }
}
