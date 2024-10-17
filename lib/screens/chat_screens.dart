import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:iosgsmarket/src/repo/sql_chatDatabaseService.dart';

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
  final SqlChatdatabaseservice _dbService = SqlChatdatabaseservice();

  @override
  void initState() {
    super.initState();
    _loadMessagesFromDB();
  }

  // DB에서 메시지 불러오기
  Future<void> _loadMessagesFromDB() async {
    final messages = await _dbService.getMessages();
    setState(() {
      _messages.addAll(messages);
    });
  }

  // 메시지 전송 및 DB 저장
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

    // DB에 메시지 저장
    await _dbService.insertMessage(message);

    _controller.clear();
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
