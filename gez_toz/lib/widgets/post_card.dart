
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gez_toz/classes/post.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gez_toz/my_colors.dart';
import 'package:gez_toz/widgets/carousel_indicator.dart';

class PostCard extends StatefulWidget {
  Post post;


  PostCard({ required this.post });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int _current = 0;
  CarouselController carouselController = CarouselController();

  Widget getImageWidget(String url){
    return ClipRRect(
      child: Container(
        width: double.infinity,
        child: Image.asset(url,
        fit: BoxFit.fill),
      ),
    );
  }

  List<Widget> getIndicatorWidgets(){
    List<Widget> indicators = [];

    int length = widget.post.imageURLs.length;
    for(int i=0; i<length; i++){
      if(i == _current){
        indicators.add(CarouselIndicator(bg: Colors.white, border: Colors.black));
      }
      else {
        indicators.add(CarouselIndicator(bg: Colors.black, border: Colors.black));
      }
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.post.user.imageURL),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex:1,
                  child: Text(widget.post.user.username,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(MyColors.darkGray),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child:CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 300,
                      viewportFraction: 1,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      aspectRatio: 2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }
                    ),
                    items: widget.post.imageURLs.map((url) => getImageWidget(url)).toList(),
                  ),
                ),
                widget.post.imageURLs.length > 1 ? (
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Container(
                      child: Row(
                        children: getIndicatorWidgets(),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  )
                ) : SizedBox()
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: (){},
                        child: Icon(Icons.favorite, size: 30,)
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed("/comments");
                        },
                        child: Icon(Icons.chat, size: 30,),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: (){},
                        child: Text("Detaylar", style: TextStyle(fontSize: 18),),
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 5, right: 5, bottom: 4),
                  alignment: Alignment.centerLeft,
                  child: Text(widget.post.headLine, textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 8, right: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(widget.post.experience, textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]), maxLines: 2,),
                ),
                SizedBox(height: 5),
              ],
            ),
          )
        ],
      )
    );
  }
}
