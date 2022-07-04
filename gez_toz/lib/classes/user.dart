
class User {
  int id;
  String imageURL;
  String username;
  String? about;
  int? postCount, followerCount, likeCount;

  User({
    required this.id,
    required this.imageURL, required this.username,
    this.postCount, this.followerCount,
    this.likeCount, this.about
  });
}