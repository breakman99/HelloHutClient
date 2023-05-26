import 'package:flutter/material.dart';

class MyTestWidget1 extends StatelessWidget {
  const MyTestWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          'images/school_pic.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        TitleSectionWidget(),
        ButtonSectionWidget(),
        TextSectionWidget(),
      ],
    );
  }
}

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    '湖工大山水摄影比赛，留下最美照片，快来参赛吧~',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '湖南工业大学文体部',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          StarsWidget(),
        ],
      ),
    );
  }
}

class StarsWidget extends StatefulWidget {
  const StarsWidget({super.key});

  @override
  State<StarsWidget> createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconAnimation;
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _iconAnimation = Tween<double>(
      begin: 24,
      end: 36,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          //padding: const EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          //iconSize: _iconAnimation.value,
          icon: (_isFavorited
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border)),
          color: Theme.of(context).colorScheme.primary,
          onPressed: _toggleFavorite,
          tooltip: _isFavorited ? 'Remove from favorites' : 'Add to favorites',
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        _animationController.reverse();
      } else {
        _favoriteCount += 1;
        _animationController.forward();
        _isFavorited = true;
      }
    });
  }
}

class ButtonSectionWidget extends StatelessWidget {
  const ButtonSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '联系'),
        _buildButtonColumn(color, Icons.star, '收藏'),
        _buildButtonColumn(color, Icons.share, '分享'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSectionWidget extends StatelessWidget {
  const TextSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        "大家好！湖工大山水摄影比赛即将举行，这是一个展示你摄影才华的绝佳机会！无论你是专业摄影师还是摄影爱好者，都有机会在这个比赛中留下属于自己的最美瞬间。"
        "湖工大山水摄影比赛旨在通过镜头展现大学校园的自然之美，为同学们提供一个分享和展示自己摄影技巧的平台。无论是湖边的清晨，还是校园内的花海，每一个角落都可能是你的摄影创作灵感的源泉。"
        "参加比赛非常简单！只需在比赛规定的时间内拍摄你认为最美的山水照片，并将照片提交给我们的评委团队。比赛评选将考虑照片的构图、光线、色彩以及整体美感等方面的因素。"
        "这个比赛不仅仅是一场竞争，更是一个学习和交流的机会。你将有机会与其他摄影爱好者分享你的摄影技巧和经验，并从他们那里学习到更多。无论你是新手还是老手，这个比赛都将为你提供一个成长的平台。"
        "参赛还有机会赢得丰厚的奖品和荣誉！最佳摄影作品将获得奖金和荣誉证书，并有机会在学校的摄影展览中展出。你的作品将被广大同学和教职员工欣赏，让更多人了解你的才华。"
        "快来参加湖工大山水摄影比赛吧！展示你的摄影才华，捕捉自然之美的瞬间，留下属于你的最美照片。不要犹豫，赶紧行动起来！让我们一起创造一个令人难忘的摄影之旅！"
        "记得在比赛规定的时间内提交你的作品，并期待我们评委团队的精彩评选结果。祝愿每位参赛者都能拍出令人惊叹的作品！加入我们，一起感受摄影的魅力！",
        softWrap: true,
      ),
    );
  }
}
