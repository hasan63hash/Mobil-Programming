import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gez_toz/classes/comment.dart';
import 'package:gez_toz/my_colors.dart';

class CommentCard extends StatefulWidget {
  Comment comment;
  CommentCard({ required this.comment });

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ]
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.comment.user.imageURL),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: Text(widget.comment.user.username,
                    style: TextStyle(
                      color: Color(MyColors.darkGray),
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8)
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Text(widget.comment.commentText,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Container(
                  width: 35,
                  child: IconButton(
                      onPressed: (){
                      },
                      icon: Icon(Icons.favorite, color: Colors.blue, size: 25)
                  ),
                ),
                Text(
                  widget.comment.likeCount.toString()
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

