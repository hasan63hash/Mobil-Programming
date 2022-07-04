import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatefulWidget {
  Widget child;
  String title;
  PropertyCard({ required this.title, required this.child });

  @override
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isClosed = true;
  Icon current_icon = Icon(Icons.keyboard_arrow_down, size: 35);
  final closed_icon = Icon(Icons.keyboard_arrow_down, size: 35);
  final open_icon = Icon(Icons.keyboard_arrow_up, size: 35);

  void toggleBody(){
    setState(() {
      if(isClosed == true){ // Kapalıysa
        isClosed = false;
        current_icon = open_icon;
      }
      else{
        isClosed = true;
        current_icon = closed_icon;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child: Column(
        children: [
         GestureDetector(
           onTap: (){
             FocusScope.of(context).requestFocus(new FocusNode());
             toggleBody();
           },
           child: Container(
             height: 55,
             width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(4),
             ),
             child: Container(
               padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Expanded(
                       child: Text(
                         widget.title,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                   ),
                   current_icon,
                 ],
               ),
             ),
           )
         ),
          isClosed ? (SizedBox()) : (Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: widget.child,
          )),
        ],
      ),
    );
  }
}
