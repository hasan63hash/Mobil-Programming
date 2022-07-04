import 'package:bilgi_testi_uygulama/test_veri.dart';
import 'package:flutter/material.dart';
import 'constants.dart';


void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
 int soruindex=0,dogrusayisi=0,yanlissayisi=0,toplampuan=0;
 List <Widget> secimler = [ ];
 TestVeri test_1=TestVeri();
 void butonFonksiyonu(bool secilenButon ){

   if(testBittiMi()==true){
     showDialog(
       context: context,
       builder: (BuildContext context) {
         // return object of type Dialog
         return AlertDialog(
           title: new Text("Tebrikler Test Bitti"),
           content: new Text("Toplam doğru cevap sayısı  = $dogrusayisi \n"
               "Toplam yanlış cevap sayisi = $yanlissayisi \n"
               "Tebrikler kazanılan puan = $toplampuan"),
           actions: <Widget>[
             // usually buttons at the bottom of the dialog
             new FlatButton(
               child: new Text("Tekrar oyna"),
               onPressed: () {
                 Navigator.of(context).pop();
                 setState(() {
                   secimler=[];
                   soruindex=0;
                   dogrusayisi=0;
                   yanlissayisi=0;
                   toplampuan=0;
                 });
               },
             ),
           ],
         );
       },
     );
   }

   setState(() {
     test_1.getSoruYaniti(soruindex)==secilenButon ? secimler.add(kDogruIconu): secimler.add(kYanlisIconu);
     test_1.getSoruYaniti(soruindex)==secilenButon ? dogrusayisi++: yanlissayisi++;
     test_1.getSoruYaniti(soruindex)==secilenButon ? toplampuan+=5: toplampuan-=3;
     soruindex<6 ? soruindex++: soruindex=0;
   });
 }
 bool testBittiMi(){
   if(soruindex +1 >=test_1.uzunluk()){
     return true;
   }
   else{ return false;}
 }

 @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(soruindex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(children:secimler,spacing: 15, runSpacing: 5,),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                           butonFonksiyonu(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}


