import 'package:flutter/material.dart';
import 'package:gez_toz/classes/post.dart';

class ExploreGridCard extends StatelessWidget {
  Post post;
  ExploreGridCard({ required this.post });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Image.asset(
        post.imageURLs[0],
        fit: BoxFit.fill,
      ),
    );
  }
}

