import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatScreens extends StatefulWidget {
  final String title;

  const ChatScreens(this.title, {super.key});

  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  final List<types.Message> _messages = [];
  final types.User _user = const types.User(id: 'user-id', firstName: 'You');
  final types.User _otherUser =
      const types.User(id: 'other-user-id', firstName: 'John');
  final _uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        customMessageBuilder: _customMessageBuilder,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: _uuid.v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });

    _simulateOtherUserResponse(message.text);
  }

  void _simulateOtherUserResponse(String userMessage) {
    Future.delayed(const Duration(seconds: 1), () {
      final response = types.TextMessage(
        author: _otherUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: _uuid.v4(),
        text: 'Echo: $userMessage',
      );

      setState(() {
        _messages.insert(0, response);
      });
    });
  }

  Widget _customMessageBuilder(types.CustomMessage message,
      {required int messageWidth}) {
    return Container(
      width: messageWidth.toDouble(),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message.metadata?['text'] ?? 'Custom Message',
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
