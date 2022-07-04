import 'dart:async';

import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? username;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void checkSession() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      username = prefs.getString("username");
    });

    Timer(
      Duration(seconds: 2),
      (){
        // Açık bir oturum yok, login'e git
        if(username == null || username!.isEmpty){
          Navigator.of(context).pushReplacementNamed("/login");
        }
        else { // Açık bir oturum var, home'a git
          Navigator.of(context).pushReplacementNamed("/home");
        }
      }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    checkSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Image.asset(
        "assets/images/splash.jpg",
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.white,
    );
  }
}
