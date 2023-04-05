import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/feature/mytest1_page.dart';
import 'src/feature/generator_page.dart';
import 'src/feature/favorite_page.dart';
import 'src/feature/main_page_feature/presentation/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/feature/main_page_feature/presentation/main_page.dart';

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
        title: 'Hello',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
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
    MainPageWidget(),
    MyTestWidget1(),
    FavoritesPage(),
    GeneratorPage(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: _scaffoldKey,
        appBar: HelloHutAppBar(
          title: 'Hello',
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: CircleAvatar(
              radius: 16.0,
              backgroundImage: AssetImage('images/lake.jpg'),
            ),
          ),
          trailing: Icon(Icons.add, color: color.onPrimary),
          onTrailingPressed: () {
            // 点击右侧按钮时的处理
          },
        ),
        drawer: Drawer(
          backgroundColor: color.background,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: color.primaryContainer,
              //   ),
              //   child: Text(
              //     'Handle Ex',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  radius: 16.0,
                  backgroundImage: AssetImage('images/lake.jpg'),
                ),
                accountName: Text("John Doe",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                accountEmail: Text("johndoe@example.com",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    )),
                // currentAccountPicture: CircleAvatar(
                //   backgroundImage: AssetImage('assets/images/profile.jpg'),
                // ),
                decoration: BoxDecoration(
                  color: color.background,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                title: Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.change_history,
                  color: Colors.black,
                ),
                title: const Text(
                  'Change history',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // change app state...
                  Navigator.pop(context); // close the drawer
                },
              ),
            ],
          ),
        ),
        body: Container(
            color: Theme.of(context).colorScheme.background,
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
