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
    final List<Post> posts = PostData.commentPosts;
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
                padding: EdgeInsets.all(2.0),
                child: PostBody(showCard: false, post: post),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Post post = posts[index];
                  return CommentBody(
                    commentPost: post,
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
  final Post commentPost;

  const CommentBody({Key? key, required this.commentPost}) : super(key: key);

  //const CommentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Divider(
        //   color: Colors.black54, //设置分割线的颜色
        //   height: 0, //设置分割线的高度间距
        //   thickness: 0.1, //设置分割线的厚度
        //   indent: 10, //设置分割线的起始缩进
        //   endIndent: 10, //设置分割线的结束缩进
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: CustomListItemTwo(
            thumbnail: CircleAvatar(
              backgroundImage: AssetImage(commentPost.userImageUrl),
              //radius: 15,
            ),
            name: commentPost.username,
            content: commentPost.content,
            author: 'Dash',
            publishDate: '2023年04月14日 14:03',
            readDuration: '5 mins',
          ),
        ),
      ],
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            Text(
              subtitle,
              maxLines: 20,
              //overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            Text(
              publishDate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.name,
    required this.content,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String name;
  final String content;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // AspectRatio(
          //   aspectRatio: 1.0,
          //   child: thumbnail,
          // ),
          thumbnail,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
              child: _ArticleDescription(
                title: name,
                subtitle: content,
                author: author,
                publishDate: publishDate,
                readDuration: readDuration,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
