import "package:flutter/material.dart";

class CardCheckBox extends StatefulWidget {
  bool value;
  void Function(bool) onChanged;
  String text;
  CardCheckBox({ required this.value, required this.onChanged, required this.text });

  @override
  _CardCheckBoxState createState() => _CardCheckBoxState();
}

class _CardCheckBoxState extends State<CardCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all(Colors.blueAccent),
          value: widget.value,
          onChanged: (bool? val){
            widget.onChanged(val!);
          },
        ),
        Text(
          widget.text,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
