import 'package:flutter/material.dart';

class ChatScreens extends StatefulWidget {
  final String title;

  const ChatScreens(this.title, {super.key});

  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('채팅 화면 구현 예정'),
      ),
    );
  }
}
