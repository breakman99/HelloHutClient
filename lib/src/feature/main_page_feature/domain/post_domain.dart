class Post {
  final String username;
  final String school;
  final String content;
  final String userImageUrl;
  final String postImageUrl;
  final int likes;
  final int comments;

  Post({
    required this.username,
    required this.school,
    required this.content,
    required this.userImageUrl,
    required this.postImageUrl,
    required this.likes,
    required this.comments,
  });
}
