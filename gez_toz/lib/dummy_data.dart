
import 'package:gez_toz/classes/Expanse.dart';
import 'package:gez_toz/other/money.dart';

import 'classes/post.dart';
import 'classes/user.dart';

class DD{
  static String profileImage = "assets/images/default.png";
  static String viewImage = "assets/images/view.jpg";
  static List<String> imageURLs = [viewImage, viewImage, viewImage];
  static String username = "hasan";
  static String headline = "Maldivlerde 5 harika gün";
  static String longText = "Çok uzun bir text gibi düşünebilirisiniz."+
  " Çok uzun bir text gibi düşünebilrisiniz. Çok uzun ama çok uzundur."+
  "Çok uzun bir text gibi düşünebilirisiniz."+
  " Çok uzun bir text gibi düşünebilrisiniz. Çok uzun ama çok uzundur.";
  static int number = 100;
  static User user = User(id: 1, username: "hasan", imageURL: profileImage, followerCount: 100, postCount: 100, likeCount: 100, about:longText);
  static Post post = Post(user: user, headLine: headline, experience: longText, imageURLs: [viewImage, viewImage]);
  static Expanse expanse = Expanse(name: "Yeme & İçme", amount: 100, money: Money.tl);
}