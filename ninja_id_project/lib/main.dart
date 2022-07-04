import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NinjaCard(),
    debugShowCheckedModeBanner: false,
  ));
}

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("ninja id card"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            ninjaLevel++;
          });
        },
        child: Icon(Icons.add,),backgroundColor: Colors.grey[800],
      )
      ,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/thumb.jpg"),
                radius: 40,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Text("Name" , style: TextStyle(
              color: Colors.grey,letterSpacing: 2.0,
            ),),
            SizedBox(height: 5,),
            Text("Chun-li" , style: TextStyle(
                color: Colors.amberAccent[200],letterSpacing: 2.0,
                fontSize: 20,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),Text("Curent ninja level" , style: TextStyle(
              color: Colors.grey,letterSpacing: 2.0,
            ),),
            SizedBox(height: 5,),
            Text("$ninjaLevel" , style: TextStyle(
                color: Colors.amberAccent[200],letterSpacing: 2.0,
                fontSize: 20,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
            Row(children: [
              Icon(Icons.email,color: Colors.grey[400],),
              SizedBox(height: 30,),
              Text("Ninja@gmail.com",style: TextStyle(
                  color: Colors.grey[400],letterSpacing: 1
              ),)

            ],),
          ],
        ),
      ),
    );
  }
}


