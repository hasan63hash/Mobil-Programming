import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasamapp/constants.dart';
import './MyContainer.dart';
import './IconCinsiyet.dart';
import './constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String seciliCinsiyet = "";
  double icilensigara = 15;
  double sporsayisi = 3;
  int boy = 170;
  int kilo=50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    renk: Colors.white,
                    child: buildRowOutlineButton("Boy"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                      renk: Colors.white, child: buildRowOutlineButton("Kilo")),
                ),
              ],
            ),
          ),
          Expanded(
              child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Haftada kaç gün spor yapion",
                  style: kMetinstili,
                ),
                Text(
                  "${sporsayisi.round()}",
                  style: kSayiStili,
                ),
                Slider(
                    value: sporsayisi,
                    min: 0,
                    max: 7,
                    divisions: 7,
                    onChanged: (double newValue) {
                      setState(() {
                        sporsayisi = newValue;
                      });
                    })
              ],
            ),
            renk: Colors.white,
          )),
          Expanded(
              child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Günde Kaç sigara içiyon",
                  style: kMetinstili,
                ),
                Text(
                  "${icilensigara.round()}",
                  style: kSayiStili,
                ),
                Slider(
                    value: icilensigara,
                    min: 0,
                    max: 30,
                    onChanged: (double newValue) {
                      setState(() {
                        icilensigara = newValue;
                      });
                    })
              ],
            ),
            renk: Colors.white,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seciliCinsiyet = "kadın";
                      });
                    },
                    child: MyContainer(
                      renk: seciliCinsiyet == "kadın"
                          ? Colors.greenAccent
                          : Colors.white,
                      child: IconCinsiyet(
                        data: "kadın",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seciliCinsiyet = "Erkek";
                      });
                    },
                    child: MyContainer(
                      renk: seciliCinsiyet == "Erkek"
                          ? Colors.greenAccent
                          : Colors.white,
                      child: IconCinsiyet(
                        data: "Erkek",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kMetinstili,
            )),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(label=="Boy"?"$boy":"$kilo", style: kMetinstili),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 10,
                    color: Colors.black87,
                  ),
                  borderSide: BorderSide(
                      style: BorderStyle.solid, color: Colors.black87),
                  onPressed: () {
                    setState(() {
                     label=="Boy" ?  boy++:kilo++;
                    });
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 10,
                    color: Colors.black87,
                  ),
                  borderSide: BorderSide(
                      style: BorderStyle.solid, color: Colors.black87),
                  onPressed: () {
                    setState(() {
                      label=="Boy" ?boy--:kilo--;
                    });
                  }),
            )
          ],
        ),
      ],
    );
  }
}
