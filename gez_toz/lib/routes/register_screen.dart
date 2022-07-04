import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gez_toz/classes/MyErrors.dart';
import 'package:gez_toz/classes/server_info.dart';
import 'package:gez_toz/my_colors.dart';
import 'package:gez_toz/widgets/toaster.dart';
import 'package:http/http.dart' as http;
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  SimpleFontelicoProgressDialog? _dialog;
  Toaster t = Toaster();

  bool isButtonsDisabled = false;
  String username="", email="", password="", password2="";
  String unError="", emError="", pwError="", pw2Error="";

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPassword2 = TextEditingController();

  bool validate(){
    bool err = false;
    if(username.isEmpty || username.length < 3 || username.length > 50){
      // Kullanıcı adı boş, kısa veya uzun
      setState(() {
        unError = "Kullanıcı adı 3 ile 50 karakter arasında olmalıdır.";
      });
      err = true;
    }
    else{
      setState(() {
        unError = "";
      });
    }
    if(email.isEmpty || email.length > 120){
      // Email boş veya uzun
      setState(() {
        emError = "Geçerli bir email giriniz.";
      });
      err = true;
    }
    else{
      setState(() {
        emError = "";
      });
    }
    if(password.isEmpty || password.length < 6 || password.length > 12){
      // Şifre boş, kısa veya uzun
      setState(() {
        pwError = "Şifre 6 ile 12 karakter arasında olmalıdır.";
      });
      err = true;
    }
    else{
      setState(() {
        pwError = "";
      });
    }
    if(password != password2){
      // Şifreler eşleşmiyor
      setState(() {
        pw2Error = "Şifreler eşleşmiyor.";
      });
      err = true;
    }
    else{
      setState(() {
        pw2Error = "";
      });
    }

    // Hepsi geçerli
    return !err;
  }

  void submitRegister() async{
    // Hata var
    if(!validate()){
      dev.log("Doğrulama hatası");
      return;
    }

    _dialog!.show(
      message: "Oluşturuluyor",
      type: SimpleFontelicoProgressDialogType.notch,
      indicatorColor: Colors.blue,
    );

    // Hata yok, post isteğini gönder
    try{
      await http.post(
        Uri.parse(ServerInfo.registerEmailPwdURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "email": email,
          "password": password
        }),
      ).then((response) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if(data.containsKey("error")){
          t.styledToast(
            msg: MyErrors.errors[data["error"]],
            color: Colors.red,
            textColor: Colors.white,
          );
        }
        else if(data.containsKey("success")){
          setState(() {
            controllerUsername.clear();
            controllerEmail.clear();
            controllerPassword.clear();
            controllerPassword2.clear();
            username = "";
            email = "";
            password = "";
            password2 = "";
          });

          t.styledToast(
            msg: "Kayıt oluşturuldu",
            color: Colors.green,
            textColor: Colors.white,
          );
        }
      }).timeout(Duration(seconds: 10));
    }catch(e) {
      t.styledToast(
        msg: "Zaman aşımı!",
        color: Colors.red,
        textColor: Colors.white,
      );
    }

    _dialog!.hide();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPassword2.dispose();
    super.dispose();
  }

  Widget errorText(String text){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "*" + text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14
        ),
      ),
    );
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
          SizedBox(height: 5),
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
                        "Kayıt",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    unError.isEmpty ? SizedBox() : errorText(unError),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        controller: controllerUsername,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          labelText: 'Username...',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                        ),
                        onChanged: (String val) {
                          setState(() {
                            username = val;
                            validate();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    emError.isEmpty ? SizedBox() : errorText(emError),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email...',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                        ),
                        onChanged: (String val){
                          setState(() {
                            email = val;
                            validate();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    pwError.isEmpty ? SizedBox() : errorText(pwError),
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
                          labelText: 'Şifre...',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                        ),
                        onChanged: (String val){
                          setState(() {
                            password = val;
                            validate();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    pw2Error.isEmpty ? SizedBox() : errorText(pw2Error),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        obscureText: true,
                        controller: controllerPassword2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Şifre Tekrar...',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                        ),
                        onChanged: (String val){
                          setState(() {
                            password2 = val;
                            validate();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 35),
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
                        onPressed: isButtonsDisabled ? null : submitRegister,
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
                            "Giriş Yap", style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                          )
                        ),
                        onPressed: isButtonsDisabled ? null : (){
                          Navigator.of(context).pushReplacementNamed("/login");
                        },
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
