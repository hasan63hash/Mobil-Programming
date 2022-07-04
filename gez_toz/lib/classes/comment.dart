
import 'package:gez_toz/classes/user.dart';

class Comment {
  User user;
  String commentText;
  int likeCount;

  Comment({
    required this.user, required this.commentText,
    required this.likeCount
  });
}