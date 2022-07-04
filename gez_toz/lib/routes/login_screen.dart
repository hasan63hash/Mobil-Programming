import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gez_toz/classes/MyErrors.dart';
import 'package:gez_toz/classes/server_info.dart';
import 'package:gez_toz/my_colors.dart';
import 'package:gez_toz/styles/font_styles.dart';
import 'package:gez_toz/widgets/toaster.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SimpleFontelicoProgressDialog? _dialog;
  Toaster t = Toaster();

  String email = "";
  String password = "";

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void loginEmailPassword() async{
    // Input kontrol
    if(email.isEmpty || password.isEmpty){
      return;
    }

    _dialog!.show(
      message: "Giriş yapılıyor",
      type: SimpleFontelicoProgressDialogType.notch,
      indicatorColor: Colors.blue,
    );

    // Post isteğini oluştur
    try{
      await http.post(
        Uri.parse(ServerInfo.loginEmailPwdURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }),
      )
          .then((response) async {
        Map<String, dynamic> data = jsonDecode(response.body);
        // Hata var ise
        if(data.containsKey("error")){
          t.styledToast(
            msg: MyErrors.errors[data["error"]],
            color: Colors.red,
            textColor: Colors.white,
          );
          _dialog!.hide();
        }
        else if(data.containsKey("user")){ // Giriş başarılı
          Map<String, dynamic> user = data["user"];

          // Session oluştur ve kullanıcıyı ekle
          bool err = false;
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("id", user["id"].toString()).then((success){
            if(!success){
              err = true;
            }
          });
          await prefs.setString("username", user["username"]).then((success){
            if(!success){
              err = true;
            }
          });
          await prefs.setString("email", user["email"]).then((success){
            if(!success){
              err = true;
            }
          });
          String imageURL = user["imageUrl"] != null ? user["image_url"] : "";
          await prefs.setString("imageURL", imageURL).then((success){
            if(!success){
              err = true;
            }
          });
          String about = user["about"] != null ? user["about"] : "";
          await prefs.setString("about", about).then((success){
            if(!success){
              err = true;
            }
          });
          await prefs.setString("registerDate", user["register_date"]).then((success){
            if(!success){
              err = true;
            }
          });
          await prefs.setString("passwordChangeDate", user["password_change_date"]).then((success){
            if(!success){
              err = true;
            }
          });

          if(err){
            t.styledToast(
              msg: "Oturum oluşturulamadı.",
              color: Colors.red,
              textColor: Colors.white,
            );
            _dialog!.hide();
          }
          else{
            Timer(
                Duration(seconds: 2),
                    (){
                  Navigator.of(context).pushReplacementNamed("/home");
                }
            );
          }
        }
      })
      .timeout(Duration(seconds: 10));
    }
    on TimeoutException{
      t.styledToast(
        msg: "Zaman Aşımı",
        color: Colors.red,
      );
      _dialog!.hide();
    }
    catch(ex) {
      t.styledToast(
        msg: ex.toString(),
        color: Colors.red,
      );
      _dialog!.hide();
    }
  }

  Widget getBody(){
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: min(MediaQuery.of(context).size.width/2, 150),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Gez",
                  style: FontStyles.darkBlueText(30)
                ),
                Text("Toz",
                  style: FontStyles.blackText(40)
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(MyColors.blue),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: 8),
                  Container(
                    child: Text(
                      "Giriş",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: controllerEmail,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String val){
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: controllerPassword,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Şifre',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      onChanged: (String val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                      color: Color(MyColors.darkBlue),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2)
                    ),
                    child: TextButton(
                      child: Text(
                          "Giriş Yap", style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                        )
                      ),
                      onPressed: loginEmailPassword,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                        color: Color(MyColors.darkBlue),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2)
                    ),
                    child: TextButton(
                      child: Text(
                          "Kayıt Ol", style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                        )
                      ),
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed("/register");
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextButton(
                      child: Text(
                          "Şifremi unuttum", style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline
                        )
                      ),
                      onPressed: (){},
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_dialog == null){
      _dialog = SimpleFontelicoProgressDialog(context: context, barrierDimisable:  false);
    }

    return Scaffold(
      body: getBody(),
      backgroundColor: Colors.white,
    );
  }
}
