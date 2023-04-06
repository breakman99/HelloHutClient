import '../domain/post_domain.dart';

class PostData {
  static final Post initPost = Post(
    username: 'Null',
    school: "门头沟学院",
    content: "",
    userImageUrl: 'images/myself.bmp',
    postImageUrl: '',
    likes: 0,
    comments: 0,
  );
  static final List<Post> posts = [
    Post(
      username: 'HandleExe',
      school: "野鸡大专人工智能学院",
      content: "真想考个研究生啊, 唉, 我好废物, 我好羡慕",
      userImageUrl: 'images/myself.bmp',
      postImageUrl: '',
      likes: 0,
      comments: 0,
    ),
    Post(
      username: '小胖',
      school: "南京大学人工智能学院",
      content: "兄弟们, 我现在是南大的爷! NJU的爷, 懂不懂NJU的含金量啊, "
          "以后本科生以后看到我, 都对我放尊重一点! 不服的话, can can need 学历[猖狂]",
      userImageUrl: 'images/xp.bmp',
      postImageUrl: 'images/408score.png',
      likes: 23,
      comments: 9,
    ),
    Post(
      username: 'der',
      school: "中南大学新能源学院",
      content: "哈哈, 就快下一阶段咯",
      userImageUrl: 'images/dp.bmp',
      postImageUrl: 'images/csu.jpeg',
      likes: 37,
      comments: 16,
    ),
    Post(
      username: 'wq',
      school: "山东大学微电子学院",
      content: "",
      userImageUrl: 'images/wq.bmp',
      postImageUrl: 'images/lake.jpg',
      likes: 37,
      comments: 16,
    ),
  ];
}
