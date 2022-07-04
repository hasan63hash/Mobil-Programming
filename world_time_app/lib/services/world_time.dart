import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime{

  String location;
  String time="";
  String flag;
  String url;
  bool isDayTime=false;

  WorldTime({required this.location,required this.flag,required this.url});

   Future <void> getTime()async{
   while(time=="" || time=="Error!"){

     try{
       Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
       Map data=jsonDecode(response.body);

       //data properties
       String datetime = data["datetime"];
       String offset=data["utc_offset"];
       String operator = offset.substring(0,1);
       String hours = offset.substring(1,3);
       String minute = offset.substring(4);

       //create datatime object
       DateTime now =DateTime.parse(datetime);
       now = now.add(Duration(hours: int.parse(hours),minutes: int.parse(minute)));
       isDayTime=now.hour>= 6 && now.hour<20? true:false;
       time=DateFormat.jm().format(now);

     }catch(e){
       time="Error!";
     }
   }

  }
}