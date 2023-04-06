import 'package:flutter/material.dart';
import '../domain/post_domain.dart';
import "../data/data.dart";

class PostBody extends StatefulWidget {
  const PostBody({
    super.key,
    required this.showCard,
    required this.post,
  });

  final Post post;
  final bool showCard;

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  @override
  Widget build(BuildContext context) {
    Widget subChildWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 65,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.post.userImageUrl),
            ),
            title: Text(
              widget.post.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget.post.school,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.black54, //设置分割线的颜色
          height: 2, //设置分割线的高度间距
          thickness: 0.1, //设置分割线的厚度
          indent: 20, //设置分割线的起始缩进
          endIndent: 20, //设置分割线的结束缩进
        ),
        SizedBox(height: 10.0),
        // content
        if (widget.post.content.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 8.0),
            child: Text(widget.post.content),
          ),
        // picture
        if (widget.post.postImageUrl.length > 1)
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0), //设置圆角半径为10
              child: Image.asset(widget.post.postImageUrl), //设置图片
            ),
          ),
        // Divider(
        //   color: Colors.grey, //设置分割线的颜色
        //   height: 10, //设置分割线的高度间距
        //   thickness: 0.2, //设置分割线的厚度
        //   indent: 20, //设置分割线的起始缩进
        //   endIndent: 20, //设置分割线的结束缩进
        // ),
        Padding(
          padding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // favorite button
              FavoriteButton(initialLikes: widget.post.likes),
              SizedBox(width: 18.0),
              // comment button
              Row(
                children: [
                  Icon(
                    Icons.mode_comment_outlined,
                    size: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(width: 6.0),
                  Text(widget.post.comments.toString()),
                ],
              ),
              SizedBox(width: 18.0),
              // collect button
              CollectButton(initialCollects: widget.post.comments)
            ],
          ),
        ),
      ],
    );
    Widget childWidget = subChildWidget;
    if (widget.showCard) {
      childWidget = Card(
        elevation: 0.7,
        child: subChildWidget,
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: childWidget,
          ),
          // Divider(
          //   color: Colors.black, //设置分割线的颜色
          //   height: 10, //设置分割线的高度间距
          //   thickness: 0.2, //设置分割线的厚度
          //   indent: 0, //设置分割线的起始缩进
          //   endIndent: 0, //设置分割线的结束缩进
          // ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final int initialLikes;

  FavoriteButton({required this.initialLikes});
  //const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isLiked = false;
  int _likes = 0;

  @override
  void initState() {
    super.initState();
    _likes = widget.initialLikes;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      borderRadius: BorderRadius.circular(5.0),
      onTap: _toggleLike,
      child: Row(
        children: [
          Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border,
            size: 14,
            color:
                _isLiked ? Colors.red : Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(width: 6.0),
          Text("$_likes"),
        ],
      ),
    );
  }
}

class CollectButton extends StatefulWidget {
  final int initialCollects;

  CollectButton({required this.initialCollects});

  @override
  State<CollectButton> createState() => _CollectButtonState();
}

class _CollectButtonState extends State<CollectButton> {
  bool _isCollected = false;
  int _collect = 0;

  @override
  void initState() {
    super.initState();
    _collect = widget.initialCollects;
  }

  void _toggleLike() {
    setState(() {
      _isCollected = !_isCollected;
      _collect += _isCollected ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      borderRadius: BorderRadius.circular(5.0),
      onTap: _toggleLike,
      child: Row(
        children: [
          Icon(
            _isCollected ? Icons.turned_in : Icons.turned_in_not,
            size: 14,
            color: _isCollected
                ? Colors.blue
                : Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(width: 6.0),
          Text("$_collect"),
        ],
      ),
    );
  }
}
