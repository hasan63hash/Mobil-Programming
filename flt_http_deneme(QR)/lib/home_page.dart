import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QRViewExample.dart';
import 'my_image_picker.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String host = "http://192.168.2.206";
  final String port = "80";
  final String imgUploadPath = "/upload";
  final String qrPath = "/get_qr";

  Dio dio = Dio();
  String imagePath = "";
  String imgResponse = "";
  String qrResponse = "";
  var bytes;

  // Galeriden fotoğraf seç
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        imagePath = image.path;
      }
    });
  }

  // Seçilen fotoğrafı POST isteği ile gönder
  void postPhoto() async {
    if (imagePath != "") {
      try {
        File file = File(imagePath);
        String filename = file.path.split('/').last;
        FormData formData = new FormData.fromMap({
          "file": await MultipartFile.fromFile(file.path,
              filename: filename, contentType: new MediaType('image', 'png')),
          "type": "image/png"
        });

        Response response = await dio.post(host + ":" + port + imgUploadPath,
            data: formData,
            options: Options(headers: {
              "accept": "*/*",
              "Authorization": "Bearer accesstoken",
              "Content-Type": "multipart/form-data"
            }));

        Fluttertoast.showToast(
            msg: "Resim gönderildi.",
            timeInSecForIosWeb: 4,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white);
        setState(() {
          imagePath = "";
        });
      } catch (e) {
        setState(() {
          imgResponse = e.toString();
        });
      }
    } else {
      setState(() {
        imgResponse = "Lütfen bir fotoğraf seçin.";
      });
    }
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  void getQrWithPost() async {
    try {
      // Bir post isteği oluştur
      Response response = await dio.post(host + ":" + port + qrPath);
      String resString = response.data.toString();
      resString = resString.split(",")[1];

      setState(() {
        qrResponse = "";
        bytes = Base64Decoder().convert(resString);
      });
    } catch (e) {
      setState(() {
        qrResponse = e.toString();
      });
    }
  }

  Widget postButton() {
    return TextButton(
      onPressed: postPhoto,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Text(
          "Resmi Gönder",
          style: TextStyle(color: Colors.white),
        ),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Http Deneme")),
      backgroundColor: Colors.grey[200],
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              MyImagePicker(imagePath: imagePath),
              SizedBox(height: 20),
              imgResponse.isNotEmpty ? Text(imgResponse) : SizedBox(),
              SizedBox(height: 10),
              postButton(),
              SizedBox(height: 10),
              qrResponse.isNotEmpty ? Text(qrResponse) : SizedBox(),
              SizedBox(height: 5),
              bytes != null
                  ? Image.memory(
                      bytes,
                      fit: BoxFit.contain,
                    )
                  : SizedBox(),
              SizedBox(height: 10),
              TextButton(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Text(
                    "Qr iste",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: getQrWithPost,
              ),
              SizedBox(height: 10),
              TextButton(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Text(
                    "Qr OKU",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed:  () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => QRViewExample(),
                  ));
                },
              ),
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Photo",
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
