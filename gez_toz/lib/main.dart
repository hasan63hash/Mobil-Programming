import 'package:flutter/material.dart';
import 'package:gez_toz/routes/add_food_drink_screen.dart';
import 'package:gez_toz/routes/comments_screen.dart';
import 'package:gez_toz/routes/explore_screen.dart';
import 'package:gez_toz/routes/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:gez_toz/routes/login_screen.dart';
import 'package:gez_toz/routes/post_screen.dart';
import 'package:gez_toz/routes/profile_screen.dart';
import 'package:gez_toz/routes/register_screen.dart';
import 'package:gez_toz/routes/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(RootApp());
}

class RootApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/splash_screen": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/home": (context) => HomeScreen(),
        "/explore": (context) => ExploreScreen(),
        "/profile": (context) => ProfileScreen(),
        "/comments": (context) => CommentsScreen(),
        "/post": (context) => PostScreen(),
        "/add_food_drink": (context) => AddFoodDrinkScreen(),
      },
    );
  }
}
