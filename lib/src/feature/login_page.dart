import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      // 执行登录逻辑，例如验证用户凭据并导航到主页
      // 替换以下代码为您的实际登录逻辑
      if (_email == 'admin' && _password == 'password') {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('登录失败'),
            content: Text('无效的用户名或密码。'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('确定'),
              ),
            ],
          ),
        );
      }
    }
  }

  void _navigateToRegister() {
    // 导航到注册页面
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '欢迎来到工大圈子',
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '邮箱',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入邮箱';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '密码',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 24.0),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         ElevatedButton(
              //           onPressed: _login,
              //           child: Text('登录'),
              //         ),
              //         ElevatedButton(
              //           onPressed:
              //               _navigateToRegister, // 添加注册按钮的 onPressed 处理函数
              //           child: Text('注册'),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              ElevatedButton(
                onPressed: _login,
                child: Text('登录'),
              ),
              SizedBox(height: 6.0),
              ElevatedButton(
                onPressed: _navigateToRegister, // 添加注册按钮的 onPressed 处理函数
                child: Text('注册'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
