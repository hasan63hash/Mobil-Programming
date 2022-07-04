import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gez_toz/classes/Expanse.dart';
import 'package:gez_toz/classes/accommodation.dart';
import 'package:gez_toz/classes/food.dart';
import 'package:gez_toz/classes/transportation.dart';
import 'package:gez_toz/dwidgets/HeadlineExperience.dart';
import 'package:gez_toz/dwidgets/post_accommodation_card.dart';
import 'package:gez_toz/dwidgets/post_expanses_card.dart';
import 'package:gez_toz/dwidgets/post_food_drink_card.dart';
import 'package:gez_toz/dwidgets/post_images.dart';
import 'package:gez_toz/dwidgets/post_locations_card.dart';
import 'package:gez_toz/dwidgets/post_tags_card.dart';
import 'package:gez_toz/dwidgets/post_transport_card.dart';
import 'package:gez_toz/styles/app_bar_styles.dart';
import 'package:gez_toz/widgets/bottom_nav_bar.dart';
import 'package:gez_toz/widgets/standard_app_bar.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String headline = "";
  String experience = "";
  List<XFile> imageFiles = [];
  List<Expanse> expanses = [];
  List<Transportation> transports = [];
  List<Accommodation> accommodations = [];
  List<Food> food = [];
  List<String> tags = [];

  void setHeadline(String newHeadline){
    headline = newHeadline;
  }

  void setExperience(String newExperience){
    experience = newExperience;
  }

  void setImageFiles(List<XFile> newFiles){
    imageFiles = newFiles;
    log(imageFiles.length.toString());
  }

  void setExpanses(List<Expanse> newExpanses){
    expanses = newExpanses;
  }

  void setTransports(List<Transportation> newTransports){
    transports = newTransports;
    log(transports.length.toString());
  }

  void setAccommodation(List<Accommodation> newAccommodations){
    accommodations = newAccommodations;
  }

  void setFood(List<Food> newFood){
    food = newFood;
  }

  void setTags(List<String> newTags){
    tags = newTags;
  }

  PreferredSizeWidget getAppBar(){
    return StandardAppBar(
        child: Text(
          "Gönderi Oluştur",
          style: AppBarStyles.standardTitle(),
        )
    );
  }

  Widget getBody(){
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              HeadlineExperience(
                setExperience: setExperience,
                setHeadline: setHeadline,
              ),
              PostImagesCard(
                setImageFiles: setImageFiles,
              ),
              PostExpansesCard(
                setExpanses: setExpanses,
              ),
              PostTransportCard(
                setTransports: setTransports,
              ),
              PostAccomodationCard(
                setAccommodation: setAccommodation
              ),
              PostFoodDrinkCard(
                setFood: setFood
              ),
              // PostLocationsCard(),
              PostTagsCard(
                setTags: setTags,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text("Gönderiyi Paylaş",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: getAppBar(),
        body: getBody(),
        bottomNavigationBar: MyBottomNavBar(currentIndex: 2)
      ),
    );
  }
}
