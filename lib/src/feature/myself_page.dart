import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/main_page_feature/domain/post_domain.dart';
import "./main_page_feature/data/data.dart";

class MyselfProfilePage extends StatelessWidget {
  final Post post;
  MyselfProfilePage({required this.post});

  @override
  Widget build(BuildContext context) {
    bool isSelf = post.username == "Null";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  // 个人背景图片
                  'images/lake.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (!isSelf)
                  Positioned(
                    top: 16,
                    left: 8,
                    child: IconButton(
                      // 返回按钮
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                if (!isSelf)
                  Positioned(
                    top: 16,
                    right: 8,
                    child: IconButton(
                      // 更多按钮
                      icon: Icon(Icons.more_horiz, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                Positioned(
                  bottom: 10,
                  left: 16,
                  child: CircleAvatar(
                    // 个人头像
                    radius: 48,
                    backgroundImage: AssetImage('images/myself.bmp'),
                  ),
                ),
                if (isSelf)
                  Positioned(
                    bottom: 10,
                    right: 16,
                    child: FloatingActionButton(
                      // 编辑个人资料按钮
                      onPressed: () {},
                      child: Icon(Icons.edit),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 个人用户名
                    'HandleEX',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    // 个人简介
                    'I wanna be a Google Software Engineer!',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Row(
                    // 关注/被关注/推文数
                    children: [
                      Column(
                        children: [
                          Text(
                            '100',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 24),
                      Column(
                        children: [
                          Text(
                            '100',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 24),
                      Column(
                        children: [
                          Text(
                            '100',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Tweets',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  //if (!isSelf)
                  Row(
                    // 关注 & 发送消息按钮
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Follow'),
                        ),
                      ),
                      SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Message'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Photos and videos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Image.asset(
                            'images/lake.jpg',
                            height: 200,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Liked tweets',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Image.asset(
                            'images/lake.jpg',
                            height: 200,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
