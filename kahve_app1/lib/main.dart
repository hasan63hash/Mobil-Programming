import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Satisfy"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.lime,
                backgroundImage: AssetImage("assets/images/kahve.jpg"),
              ),
              Text(
                "Flutter Kahvecisi",
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.brown[900],
                    fontFamily: "Satisfy"),
              ),
              Text(
                "Bir Fincan Uzağınızda",
                style: GoogleFonts.pacifico(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 200,
                  child: Divider(height: 30,color: Colors.brown[900],)),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 45),
                color: Colors.brown[900],
                child: ListTile(leading:Icon(Icons.phone,color: Colors.white,
                ) ,
                  title: Text("sipariş@kahveci.com ",style: TextStyle(color: Colors.white,fontSize: 20.0),) ,
                ),
              ),
              SizedBox(height: 10,),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 45),
                color: Colors.brown[900],
                child: ListTile(leading:Icon(Icons.phone,color: Colors.white,
                 ) ,
                  title: Text("+90 555 55 55 ",style: TextStyle(color: Colors.white,fontSize: 20.0),) ,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}


