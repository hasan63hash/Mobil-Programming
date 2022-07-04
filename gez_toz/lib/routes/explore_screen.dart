import 'package:flutter/material.dart';
import 'package:gez_toz/classes/post.dart';
import 'package:gez_toz/dummy_data.dart';
import 'package:gez_toz/widgets/bottom_nav_bar.dart';
import 'package:gez_toz/widgets/explore_grid_card.dart';

class ExploreScreen extends StatefulWidget {

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  List<Post> posts = [
    DD.post, DD.post,
    DD.post, DD.post,
    DD.post, DD.post,
    DD.post, DD.post,
    DD.post, DD.post,
    DD.post, DD.post,
    DD.post, DD.post,
  ];

  PreferredSizeWidget getAppBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Ara...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search, color: Colors.black, size: 30,)
          )
        ],
      )
    );
  }

  List<Widget> getGridCards(){
    return posts.map((post) => ExploreGridCard(post: post)).toList();
  }

  Widget getBody(){
    return GridView.count(
      crossAxisCount: 2,
      primary: false,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(bottom: 5),
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      children: getGridCards(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: MyBottomNavBar(currentIndex: 1),
    );
  }
}
