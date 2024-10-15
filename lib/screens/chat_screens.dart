import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

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

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final now = DateTime.now();
    final message = types.TextMessage(
      author: _user,
      createdAt: now.millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(), // 고유 ID 생성
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    });

    _controller.clear(); // 메시지 전송 후 입력 필드 비우기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,
            style: const TextStyle(color: Colors.black)), // 타이틀 색상 설정
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
