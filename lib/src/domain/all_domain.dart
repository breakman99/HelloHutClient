class Post {
  String username;
  String school;
  String content;
  String userImageUrl;
  String postImageUrl;
  int likes;
  bool isLiked;
  int comments;
  int type;
  User user;

  Post({
    required this.username,
    required this.school,
    required this.content,
    required this.userImageUrl,
    required this.postImageUrl,
    required this.likes,
    required this.isLiked,
    required this.comments,
    required this.type,
    required this.user,
  });
}

class User {
  String username;
  String email;
  String password;
  int xh;
  String bio;
  String postImageUrl;
  String userImageUrl;
  String school;
  int postCount;
  int followingCount;
  int followersCount;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.bio,
    required this.xh,
    required this.postImageUrl,
    required this.userImageUrl,
    required this.school,
    required this.postCount,
    required this.followingCount,
    required this.followersCount,
  });
}
