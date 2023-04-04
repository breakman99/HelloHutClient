import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/feature/mytest1_page.dart';
import 'src/feature/generator_page.dart';
import 'src/feature/favorite_page.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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

  void _switchPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: _pages.elementAt(_currentIndex)),
        // body: Row(
        //   children: [
        //     SafeArea(
        //       child: NavigationRail(
        //         extended: constraints.maxWidth >= 600,
        //         destinations: [
        //           NavigationRailDestination(
        //             icon: Icon(Icons.home),
        //             label: Text('Home'),
        //           ),
        //           NavigationRailDestination(
        //             icon: Icon(Icons.favorite),
        //             label: Text('Favorites'),
        //           ),
        //           NavigationRailDestination(
        //             icon: Icon(Icons.abc),
        //             label: Text('Test Page 1'),
        //           ),
        //         ],
        //         selectedIndex: selectedIndex,
        //         onDestinationSelected: (value) {
        //           setState(() {
        //             selectedIndex = value;
        //           });
        //         },
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //           color: Theme.of(context).colorScheme.primaryContainer,
        //           child: page),
        //     ),
        //   ],
        // ),
        bottomNavigationBar: BottomNavigationBar(
          // 创建一个底部导航栏
          items: const <BottomNavigationBarItem>[
            // 提供四个图标按钮
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
          selectedItemColor: theme.colorScheme.onPrimaryContainer,
          unselectedItemColor: theme.colorScheme.outline,
        ),
      );
    });
  }
}
