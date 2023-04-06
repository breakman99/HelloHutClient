import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/main_page_feature/presentation/post_detail_page.dart';
import '../domain/post_domain.dart';
import "../data/data.dart";
import 'component.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final List<Post> posts = PostData.posts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetailPage(post: post)),
              );
            },
            child: PostBody(showCard: true, post: post));
      },
    );
  }
}
