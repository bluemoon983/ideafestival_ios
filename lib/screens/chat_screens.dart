import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:iosgsmarket/src/repo/chat_database.dart';

class ChatScreens extends StatefulWidget {
  final String name;
  const ChatScreens({super.key, required this.name});

  @override
  _ChatScreensState createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  final List<types.Message> _messages = [];
  final types.User _user = const types.User(id: 'user');
  final TextEditingController _controller = TextEditingController();
  final ChatDatabase _chatDatabase = ChatDatabase(); // 데이터베이스 인스턴스

  @override
  void initState() {
    super.initState();
    _loadMessages(); // 기존 메시지 로드
  }

  Future<void> _loadMessages() async {
    final messages = await _chatDatabase.getMessages();
    setState(() {
      _messages.addAll(messages.reversed); // 최신 메시지부터 보여주기 위해 역순으로 추가
    });
  }

  void _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final now = DateTime.now();
    final message = types.TextMessage(
      author: _user,
      createdAt: now.millisecondsSinceEpoch,
      id: now.millisecondsSinceEpoch.toString(),
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    });

    _controller.clear();

    await _chatDatabase.insertMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: (partialText) {
          _sendMessage(partialText.text);
        },
        user: _user,
      ),
    );
  }
}
