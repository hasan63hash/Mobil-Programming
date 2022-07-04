import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:gez_toz/widgets/property_addable_card.dart';
import 'package:gez_toz/widgets/tag_pill.dart';

class PostTagsCard extends StatefulWidget {

  Function setTags;

  PostTagsCard({ required this.setTags });

  @override
  _PostTagsCardState createState() => _PostTagsCardState();
}

class _PostTagsCardState extends State<PostTagsCard> {

  String tag = "";
  TextEditingController txtController = TextEditingController();
  List<String> tags = [
  ];

  void addTag() {
    if(tag.isNotEmpty && tags.indexOf(tag) == -1){
      tags.add(tag);
      widget.setTags(tags);
      txtController.clear();
      tag = "";
    }
  }

  void removeTag(String tag){
    tags.remove(tag);
    widget.setTags(tags);
  }

  Widget getBody(){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tags.isNotEmpty ? (Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 5),
            child: Text("Silmek için tıklayınız.", style: TextStyle(color: Colors.red)),
          )) : SizedBox(),
          Wrap(
            children: tags.map((tag) => Container(
              margin: EdgeInsets.only(right: 8, bottom: 8),
              child: TagPill(tag: tag, onTap: (){
                setState(() {
                  removeTag(tag);
                });
              }),
            )).toList(),
          ),
        ],
      )
    );
  }

  Widget getForm(){
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Text(
            "#",
            style: TextStyle(
              fontSize: 40,
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 15),
              child: TextField(
                maxLength: 30,
                controller: txtController,
                decoration: InputDecoration(
                    labelText: "Etiketi girin...",
                    contentPadding: EdgeInsets.zero
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                onChanged: (String value) {
                  tag = value;
                },
              ),
            ),
          )
        ],
      )
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
        title: "Etiket(ler)",
        body: getBody(),
        addBtnTitle: "Etiket Ekle",
        addingForm: getForm(),
        onAdd: (){
          setState(() {
            addTag();
          });
        },
    );
  }
}
