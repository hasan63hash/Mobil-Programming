
import 'package:gez_toz/classes/user.dart';

class Post {
  User user;
  List<String> imageURLs;
  String headLine;
  String experience;

  Post({
    required this.user, required this.imageURLs,
    required this.headLine, required this.experience
  });
}