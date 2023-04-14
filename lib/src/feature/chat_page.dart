import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: ListView.builder(
        itemCount: 20, // 假设有20个聊天会话
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Chat ${index + 1}'),
            subtitle: Text('Last message'),
            trailing: Text('Time'),
            onTap: () {
              // 点击聊天会话，跳转到聊天详情页
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(
                      //chatId: 'Chat ${index + 1}',
                      ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 点击添加按钮，跳转到新建聊天页面
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewChatPage()),
          );
        },
      ),
    );
  }
}

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<String> _messages = [];

  final TextEditingController _textEditingController = TextEditingController();

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _messages.insert(0, text);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: '输入信息',
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textEditingController.text),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String message, bool isMe) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.grey[300] : Colors.blue[200],
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.black : Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return Flexible(
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.all(8.0),
        itemCount: _messages.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildMessage(_messages[index], index % 2 == 0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Detail Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildMessageList(),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}

class NewChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Chat'),
      ),
      body: Center(
        child: Text('New Chat Page'),
      ),
    );
  }
}
