import 'package:flutter/material.dart';
import 'package:gez_toz/dummy_data.dart';
import 'package:gez_toz/widgets/bottom_nav_bar.dart';
import 'package:gez_toz/widgets/mini_story_card.dart';
import 'package:gez_toz/widgets/post_card.dart';
import 'package:gez_toz/classes/story.dart';
import 'package:gez_toz/styles/app_bar_styles.dart';
import 'package:gez_toz/styles/font_styles.dart';
import 'package:gez_toz/widgets/standard_app_bar.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List stories = [
    Story(userName: "Hasan Korkmaz", imageURL: "assets/images/view.jpg"),
    Story(userName: "Oktay Canki", imageURL: "assets/images/view.jpg"),
    Story(userName: "Hasan Korkmaz.", imageURL: "assets/images/view.jpg"),
    Story(userName: "Oktay Canki", imageURL: "assets/images/view.jpg"),
  ];

  List<String> imageURLs = [
    "assets/images/view.jpg",
    "assets/images/view.jpg",
    "assets/images/view.jpg",
  ];

  List posts = [
    DD.post, DD.post, DD.post
  ];

  PreferredSizeWidget getAppBar() {
    return StandardAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("Gez", style: FontStyles.darkBlueText(20)),
              Text("Toz", style: FontStyles.blackText(20)),
            ],
          ),
          /*
            Image.asset("assets/images/logo.png",
            width: 48, height: 48),
          */
          Text("Anasayfa", style: AppBarStyles.standardTitle()),
        ],
      ),
    );
  }

  List<Widget> getStoryWidgets() {
    return stories.map((story) => MiniStoryCard(story: story)).toList();
  }

  List<Widget> getPostWidgets() {
    return posts.map((post) => PostCard(post: post)).toList();
  }

  Widget getBody() {
    return ListView(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.only(top: 10, bottom: 5),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: getStoryWidgets(),
          ),
        ),
        Divider(
          height: 4,
          thickness: 2,
          indent: 10,
          endIndent: 10,
          color: Colors.black,
        ),
        Column(
          children: getPostWidgets(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: MyBottomNavBar(currentIndex: 0),
    );
  }
}

