


import 'Soru.dart';

class TestVeri{

  List <Soru> _soruBankasi = [
    Soru("1.Titanic gelmiş geçmiş en büyük gemidir",false),
    Soru("2.Dünyadaki tavuk sayısı insan sayısından fazladır",true),
    Soru("3.Kelebeklerin ömrü bir gündür",false),
    Soru("4.Dünya düzdür",false),
    Soru("5.Kaju fıstığı aslında bir meyvenin sapıdır",true),
    Soru("6.Fatih Sultan Mehmet hiç patates yememiştir",true),
    Soru("7.Fransızlar 80 demek için, 4 - 20 der",true),
  ];

  String getSoruMetni(int soruindex){
    return _soruBankasi[soruindex].soruMetni;
  }
  bool getSoruYaniti(int soruindex){
    return _soruBankasi[soruindex].soruYaniti;
  }
  int uzunluk(){
    return _soruBankasi.length;
  }


}