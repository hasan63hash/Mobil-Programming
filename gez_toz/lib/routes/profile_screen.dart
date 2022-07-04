import 'package:flutter/material.dart';
import 'package:gez_toz/classes/post.dart';
import 'package:gez_toz/classes/user.dart';
import 'package:gez_toz/dummy_data.dart';
import 'package:gez_toz/styles/app_bar_styles.dart';
import 'package:gez_toz/widgets/bottom_nav_bar.dart';
import 'package:gez_toz/widgets/explore_grid_card.dart';
import 'package:gez_toz/widgets/standard_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user = DD.user;
  Widget tabBody = Text("TabBody");
  List<Post> userPosts = [
    DD.post, DD.post, DD.post ,DD.post , DD.post
  ];

  PreferredSizeWidget getAppBar(){
    return StandardAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Kullanıcı adı",
            style: AppBarStyles.standardTitle(),
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.of(context).pushReplacementNamed("/login");
            },
          )
        ],
      )
    );
  }

  Widget getUserPostWidgets(){
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      primary: false,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(bottom: 15),
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      children: userPosts.map((post) => ExploreGridCard(post: post)).toList(),
    );
  }

  Widget getUserLocationWidgets(){
    return Text("Kullanıcı konumları");
  }

  Widget getBody(){
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(user.imageURL),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 75),
                child: Column(
                  children: [
                    Text(user.postCount.toString(), style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("Gönderi", overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 75),
                child: Column(
                  children: [
                    Text(user.followerCount.toString(), style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("Takipçi", overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 75),
                child: Column(
                  children: [
                    Text(user.likeCount.toString(), style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("Beğeni", overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: Text(user.about!),
        ),
        SizedBox(height: 25),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: (){},
                  child: Icon(Icons.flight_takeoff, size: 35)
              )
            ),
            Expanded(
                flex: 1,
                child: TextButton(
                    onPressed: (){},
                    child: Icon(Icons.map, size: 35)
                )
            ),
          ],
        ),
        getUserPostWidgets()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: MyBottomNavBar(currentIndex: 3),
    );
  }
}
