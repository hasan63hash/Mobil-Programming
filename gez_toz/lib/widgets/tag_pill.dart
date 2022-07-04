
import "package:flutter/material.dart";

class TagPill extends StatelessWidget {
  String tag;
  void Function()? onTap;
  TagPill({ required this.tag, this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
        child: Text("#" + tag,
          style: TextStyle(
            color: Colors.blue,
          )
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.blue,
            width: 1,
          )
        ),
      ),
    );
  }
}
