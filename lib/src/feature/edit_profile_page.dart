import 'package:flutter/material.dart';
import '../constants/data.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _bio = '';

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // 执行保存逻辑，比如提交数据到服务器
      DefaultUser.myself.username = _name;
      DefaultUser.myself.email = _email;
      DefaultUser.myself.bio = _bio;
      Navigator.pushNamed(context, '/home');
      // 显示保存成功提示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('保存成功'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('修改个人信息'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: '姓名',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入姓名';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '邮箱',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入邮箱';
                  }
                  // 验证邮箱格式
                  // ...
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '个人简介',
                ),
                maxLines: 3,
                onSaved: (value) {
                  _bio = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
