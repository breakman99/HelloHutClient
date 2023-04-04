import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/feature/mytest1_page.dart';
import 'src/feature/generator_page.dart';
import 'src/feature/favorite_page.dart';
import 'src/feature/main_page_feature/presentation/app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'My First Application',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  static final _pages = <Widget>[
    GeneratorPage(),
    FavoritesPage(),
    MyTestWidget1(),
    Placeholder(),
  ];

  final _scrollController = ScrollController();
  double _appBarOpacity = 0.0;
  final _appBarMaxOpacity = 0.9;
  final _appBarMinOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _appBarOpacity = (_scrollController.offset / 200.0)
            .clamp(_appBarMinOpacity, _appBarMaxOpacity);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _switchPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: HelloHutAppBar(
          title: 'HelloHut',
          leading: CircleAvatar(
            radius: 16.0,
            //backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          trailing: Icon(Icons.add, color: color.primary),
          onTrailingPressed: () {
            // 点击右侧按钮时的处理
          },
        ),
        drawer: Drawer(
          backgroundColor: color.onInverseSurface,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: color.primaryContainer,
                ),
                child: Text(
                  'Handle Ex',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: _pages.elementAt(_currentIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _switchPage,
          selectedItemColor: color.onPrimaryContainer,
          unselectedItemColor: color.outline,
        ),
      );
    });
  }
}
