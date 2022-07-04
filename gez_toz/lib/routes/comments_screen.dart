
import 'package:flutter/material.dart';
import 'package:gez_toz/classes/comment.dart';
import 'package:gez_toz/classes/user.dart';
import 'package:gez_toz/dummy_data.dart';
import 'package:gez_toz/styles/app_bar_styles.dart';
import 'package:gez_toz/widgets/comment_card.dart';
import 'package:gez_toz/widgets/standard_app_bar.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  
  List<Comment> comments = [
    Comment(user: DD.user, commentText: DD.longText, likeCount: DD.number),
    Comment(user: DD.user, commentText: DD.longText, likeCount: DD.number)
  ];

  PreferredSizeWidget getAppBar(){
    return StandardAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Yorumlar", style: AppBarStyles.standardTitle()),
        ],
      ),
    );
  }

  List<Widget> getCommentWidgets() {
    List<Widget> children = [];

    children.add(
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
          color: Colors.blue,
          child: TextButton(
            onPressed: (){},
            child: Text("Yorum Yap",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ),
        )
    );

    comments.forEach((comment) {
      children.add(CommentCard(comment: comment));
    });

    return children;
  }

  Widget getBody() {

    return ListView(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      children: getCommentWidgets(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }
}
