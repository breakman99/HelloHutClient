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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 3),
      child: Card(
        elevation: 1,
        color: Theme.of(context).colorScheme.surface,
        child: CustomListItemTwo(
          thumbnail: CircleAvatar(
            backgroundImage: AssetImage(commentPost.userImageUrl),
            //radius: 15,
          ),
          title: 'Flutter 1.0 Launch',
          subtitle: 'Flutter continues to improve and expand its horizons. '
              'This text should max out at two lines and clip',
          author: 'Dash',
          publishDate: 'Dec 28',
          readDuration: '5 mins',
        ),
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         ListTile(
        //           leading: CircleAvatar(
        //             backgroundImage: AssetImage(commentPost.userImageUrl),
        //             radius: 15,
        //           ),
        //           title: Text(
        //             commentPost.username,
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               fontSize: 12,
        //             ),
        //           ),
        //           subtitle: Text(
        //             commentPost.school,
        //             style: TextStyle(
        //               fontSize: 9,
        //               color: Colors.grey,
        //               fontWeight: FontWeight.normal,
        //             ),
        //           ),
        //         ),
        //         Divider(
        //           color: Colors.grey, //设置分割线的颜色
        //           height: 8, //设置分割线的高度间距
        //           thickness: 0.2, //设置分割线的厚度
        //           indent: 0, //设置分割线的起始缩进
        //           endIndent: 0, //设置分割线的结束缩进
        //         ),
        //         Text('笑死了'),
        //       ],
        //     ),
        //   ),
        // ),
      ),
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
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                author,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // AspectRatio(
            //   aspectRatio: 1.0,
            //   child: thumbnail,
            //   child: thumbnail,
            // ),
            thumbnail,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.pink),
          ),
          title: '1Flutter 1.0 Launch',
          subtitle: 'Flutter continues to improve and expand its horizons. '
              'This text should max out at two lines and clip',
          author: 'Dash',
          publishDate: 'Dec 28',
          readDuration: '5 mins',
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: 'Flutter 1.2 Release - Continual updates to the framework',
          subtitle: 'Flutter once again improves and makes updates.',
          author: 'Flutter',
          publishDate: 'Feb 26',
          readDuration: '12 mins',
        ),
      ],
    );
  }
}
