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
      username: 'HandleExe',
      content: "I really wanna improve my English Reading Comprehension "
          "so that I can understand some professional documents in "
          "computer science without any difficulty.",
      userImageUrl: 'images/lake.jpg',
      postImageUrl: '',
      likes: 15,
      comments: 4,
    ),
    Post(
      username: 'Jane Doe',
      content: "Mother Terisa, who received a Nobel Peace Prize for her work"
          " on behalf of the poor, dies in Calcuta Indian. She was 87 years old",
      userImageUrl: 'images/lake.jpg',
      postImageUrl: 'images/lake.jpg',
      likes: 23,
      comments: 9,
    ),
    Post(
      username: 'Bob Smith',
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Awesome Snackbar!'),
                  action: SnackBarAction(
                    label: 'Action',
                    onPressed: () {
                      // Code to execute.
                    },
                  ),
                ),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                elevation: 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
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
                        "野鸡大学人工智能学院",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    if (post.content.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 8.0),
                        child: Text(post.content),
                      ),
                    if (post.postImageUrl.length > 1)
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
                        child: Image.asset(post.postImageUrl),
                      ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 18.0),
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
