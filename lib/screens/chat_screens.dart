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

  void _deleteMessage(types.Message message) async {
    setState(() {
      _messages.removeWhere((msg) => msg.id == message.id);
    });

    await _chatDatabase.deleteMessage(message.id); // 데이터베이스에서 메시지 삭제
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, types.Message message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("메시지 삭제"),
          content: const Text("이 메시지를 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text(
                "취소",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _deleteMessage(message); // 메시지 삭제 함수 호출
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text(
                "삭제",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        messages: _messages,
        onSendPressed: (partialText) {
          _sendMessage(partialText.text);
        },
        onMessageLongPress: (context, message) {
          _showDeleteConfirmationDialog(
              context, message); // 길게 눌렀을 때 삭제 다이얼로그 표시
        },
        user: _user,
        theme: const DefaultChatTheme(
          primaryColor: Colors.black12, // 사용자가 보낸 메시지의 색상
          receivedMessageBodyTextStyle:
              TextStyle(color: Colors.black), // 받은 메시지 텍스트 색상
          sentMessageBodyTextStyle:
              TextStyle(color: Colors.black), // 보낸 메시지 텍스트 색상
        ),
      ),
    );
  }
}
