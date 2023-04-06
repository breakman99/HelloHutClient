import 'package:flutter/material.dart';
import "component.dart";
import '../domain/post_domain.dart';
import "../data/data.dart";

class PostDetailPage extends StatefulWidget {
  final Post post;
  PostDetailPage({required this.post});
  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Post post = PostData.initPost;
  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Hello Hut'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 0.7,
          child: Column(
            children: [
              PostBody(
                  showCard: false, post: post), // 使用 StatelessWidget 来构建帖子主体
              Expanded(
                child: CommentBody(), // 使用 StatefulWidget 来构建评论列表
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentBody extends StatefulWidget {
  const CommentBody({
    super.key,
  });

  @override
  State<CommentBody> createState() => _CommentBodyState();
}

class _CommentBodyState extends State<CommentBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(2),
      children: [
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'test',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'test',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'test',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'test',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'test',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'test',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'test',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
