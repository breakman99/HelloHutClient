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
    final List<Post> posts = PostData.Commentposts;
    return Scaffold(
      appBar: PostDetailAppBar(),
      // body: Padding(
      //   padding: const EdgeInsets.all(4.0),
      //   child: Card(
      //     elevation: 0.7,
      //     child: ListView(children: <Widget>[
      //       PostBody(showCard: false, post: post),
      //       CommentBody(),
      //     ]),
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        child: Card(
          elevation: 0.7,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4.0),
                child: PostBody(showCard: false, post: post),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Post post = posts[index];
                  return CommentBody(
                    commentData: post,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  const PostDetailAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Hello Hut'),
        ),
      ],
    );
  }
}

class CommentBody extends StatelessWidget {
  final Post commentData;

  const CommentBody({Key? key, required this.commentData}) : super(key: key);

  //const CommentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '小胖',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Divider(
                  color: Colors.grey, //设置分割线的颜色
                  height: 8, //设置分割线的高度间距
                  thickness: 0.2, //设置分割线的厚度
                  indent: 0, //设置分割线的起始缩进
                  endIndent: 0, //设置分割线的结束缩进
                ),
                Text('笑死了'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
