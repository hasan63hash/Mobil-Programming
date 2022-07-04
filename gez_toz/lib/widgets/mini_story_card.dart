import 'package:flutter/material.dart';
import 'package:gez_toz/classes/story.dart';
import 'package:gez_toz/my_colors.dart';

class MiniStoryCard extends StatelessWidget{
  Story story;
  MiniStoryCard({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 33 ,
            backgroundColor: Color(MyColors.darkBlue),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(story.imageURL),
                  fit: BoxFit.cover
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Text(story.userName,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center),

            constraints: BoxConstraints(maxWidth: 95),
          )
        ],
      ),
    );
  }
}