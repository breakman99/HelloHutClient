import 'package:flutter/material.dart';
import '../domain/post_domain.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final List<Post> posts = [
    Post(
      username: 'HanXu',
      school: "野鸡大学人工智能学院",
      content: "I really wanna improve my English Reading Comprehension "
          "so that I can understand some professional documents in "
          "computer science without any difficulty.",
      userImageUrl: 'images/lake.jpg',
      postImageUrl: '',
      likes: 15,
      comments: 4,
    ),
    Post(
      username: '小胖',
      school: "南京大学人工智能学院",
      content: "Mother Terisa, who received a Nobel Peace Prize for her work"
          " on behalf of the poor, dies in Calcuta Indian. She was 87 years old",
      userImageUrl: 'images/lake.jpg',
      postImageUrl: 'images/lake.jpg',
      likes: 23,
      comments: 9,
    ),
    Post(
      username: 'dcx',
      school: "中南大学新能源学院",
      content: "",
      userImageUrl: 'images/lake.jpg',
      postImageUrl: 'images/lake.jpg',
      likes: 37,
      comments: 16,
    ),
    Post(
      username: 'wq',
      school: "山东大学芯片材料学院",
      content: "",
      userImageUrl: 'images/lake.jpg',
      postImageUrl: 'images/lake.jpg',
      likes: 37,
      comments: 16,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: GestureDetector(
            onTap: () {
              //todo goto a new page
              // Navigate to second route when tapped.
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Text("this is a comment detail page.\n to code")),
              );

              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: const Text('Awesome Snackbar!'),
              //     action: SnackBarAction(
              //       label: 'Action',
              //       onPressed: () {
              //         // Code to execute.
              //       },
              //     ),
              //   ),
              // );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                elevation: 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 65,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(post.userImageUrl),
                        ),
                        title: Text(
                          post.username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          post.school,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        //contentPadding: EdgeInsets.fromLTRB(8.0,8.0,8.0,0),
                      ),
                    ),
                    Divider(
                      color: Colors.grey, //设置分割线的颜色
                      height: 0, //设置分割线的高度间距
                      thickness: 0.2, //设置分割线的厚度
                      indent: 20, //设置分割线的起始缩进
                      endIndent: 20, //设置分割线的结束缩进
                    ),
                    SizedBox(height: 10.0),
                    // content
                    if (post.content.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 8.0),
                        child: Text(post.content),
                      ),
                    // picture
                    if (post.postImageUrl.length > 1)
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), //设置圆角半径为10
                          child: Image.asset(post.postImageUrl), //设置图片
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
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(width: 6.0),
                              Text(post.likes.toString()),
                            ],
                          ),
                          SizedBox(width: 18.0),
                          Row(
                            children: [
                              Icon(
                                Icons.chat,
                                size: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(width: 6.0),
                              Text(post.comments.toString()),
                            ],
                          ),
                          SizedBox(width: 18.0),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(width: 6.0),
                              Text(post.comments.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
