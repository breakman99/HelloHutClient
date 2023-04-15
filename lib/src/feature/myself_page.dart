import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/domain/all_domain.dart';
import '../constants/data.dart';

class MyselfProfilePage extends StatelessWidget {
  final User user;
  final bool isSinglePage;
  MyselfProfilePage({
    required this.user,
    required this.isSinglePage,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelf = (user.username == DefaultUser.myself.username);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  // 个人背景图片
                  user.postImageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // 返回按钮
                if (isSinglePage)
                  Positioned(
                    top: 16,
                    left: 8,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                // 更多按钮
                if (isSinglePage)
                  Positioned(
                    top: 16,
                    right: 8,
                    child: IconButton(
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
                    backgroundImage: AssetImage(user.userImageUrl),
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
                    user.username,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    // 个人简介
                    user.bio,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Row(
                    // 关注/被关注/推文数
                    children: [
                      Column(
                        children: [
                          Text(
                            "${user.followingCount}",
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
                            "${user.followersCount}",
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
                            "${user.postCount}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  //关注 & 发消息 （自己的个人主页不显示）
                  if (!isSelf)
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
                    'Liked posts',
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
