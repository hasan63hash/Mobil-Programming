import "package:flutter/material.dart";
import 'package:gez_toz/widgets/property_card.dart';

class PostLocationsCard extends StatefulWidget {

  @override
  _PostLocationsCardState createState() => _PostLocationsCardState();
}

class _PostLocationsCardState extends State<PostLocationsCard> {
  @override
  Widget build(BuildContext context) {
    return PropertyCard(
        title: "Konum(lar)",
        child: Container(

        )
    );
  }
}
