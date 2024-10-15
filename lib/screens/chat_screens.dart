import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'dart:math';

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
    final formattedTime = DateFormat('HH:mm').format(now);

    final message = types.TextMessage(
      author: _user,
      createdAt: now.millisecondsSinceEpoch,
      id: Random().nextInt(1000).toString(), // unique ID for each message
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        // SafeArea 추가
        child: Column(
          children: [
            Expanded(
              // Expanded로 감싸기
              child: _messages.isEmpty
                  ? const Center(
                      child: Text('No messages yet!')) // 메시지가 없을 때 기본 텍스트 표시
                  : Chat(
                      messages: _messages,
                      onSendPressed: (partialText) {
                        _sendMessage(partialText.text);
                      },
                      user: _user,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
