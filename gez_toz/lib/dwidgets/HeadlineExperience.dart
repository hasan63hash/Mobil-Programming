import "package:flutter/material.dart";

class HeadlineExperience extends StatefulWidget {

  Function setHeadline, setExperience;

  HeadlineExperience({
    required this.setHeadline, required this.setExperience
  });

  @override
  _HeadlineExperienceState createState() => _HeadlineExperienceState();
}

class _HeadlineExperienceState extends State<HeadlineExperience> {
  TextEditingController controllerExp = TextEditingController();
  TextEditingController controllerHeadline = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controllerExp.dispose();
    controllerHeadline.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
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
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                maxLength: 50,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Gönderi Başlığı...",
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  border: InputBorder.none,
                ),
                cursorHeight: 20,
                onChanged: (String val) {
                  widget.setHeadline(val);
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
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
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                maxLength: 500,
                maxLines: 4,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Deneyiminizi paylaşın...",
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  border: InputBorder.none,
                ),
                cursorHeight: 20,
                onChanged: (String val) {
                  widget.setExperience(val);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}