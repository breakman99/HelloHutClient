class Post {
  final String username;
  final String school;
  final String content;
  final String userImageUrl;
  final String postImageUrl;
  final int likes;
  final int comments;
  final int type;
  final User user;

  Post({
    required this.username,
    required this.school,
    required this.content,
    required this.userImageUrl,
    required this.postImageUrl,
    required this.likes,
    required this.comments,
    required this.type,
    required this.user,
  });
}

class User {
  final String username;
  final String email;
  final String password;
  final int xh;
  final String bio;
  final String postImageUrl;
  final String userImageUrl;
  final String school;
  final int postCount;
  final int followingCount;
  final int followersCount;

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
