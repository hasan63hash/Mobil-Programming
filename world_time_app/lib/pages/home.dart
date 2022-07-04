import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};


  final String dayimage="assets/day.png";
  final String nightimage = "assets/night.png";
  @override
  Widget build(BuildContext context) {
    String bgimage=dayimage;
    try {
      data = data.isNotEmpty? data :  ModalRoute.of(context)!.settings.arguments as Map;
      bgimage= data["isDayTime"]?dayimage:nightimage;
    } catch (e) {}
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgimage),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                       dynamic result =  await  Navigator.pushNamed(context, "/location");
                       setState(() {
                         data={
                           "location" : result["location"],
                           "flag" : result["flag"],
                           "time":result["time"],
                           "isDayTime":result["isDayTime"],
                         };
                       });
                      },
                      icon: Icon(Icons.edit_location,color: Colors.white,size: 30,),
                      label: Text("Edit Location",style: TextStyle(color: Colors.white,fontSize: 30))),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.isNotEmpty ? data["location"] : "City...",
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data.isNotEmpty ? data["time"] : "time...",
                    style: TextStyle(fontSize: 66, color:Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
