import 'package:flutter/material.dart';

class MyMainDrawer extends StatelessWidget {
  const MyMainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Drawer(
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
          // Divider(
          //   color: Colors.black54, //设置分割线的颜色
          //   height: 10, //设置分割线的高度间距
          //   thickness: 0.2, //设置分割线的厚度
          //   indent: 20, //设置分割线的起始缩进
          //   endIndent: 20, //设置分割线的结束缩进
          // ),
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
        ],
      ),
    );
  }
}
