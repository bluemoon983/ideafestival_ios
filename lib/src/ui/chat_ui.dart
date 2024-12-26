import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/screens/chat_screens.dart';

class ChatUi extends StatelessWidget {
  const ChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    // 채팅방 데이터 샘플
    final List<Map<String, String>> chatRooms = [
      {'title': '김담율', 'message': 'ㄹㅇㅋㅋ'},
      {'title': '이세민', 'message': '고멘 아마니이 .....'},
      {'title': '함성우', 'message': '4400원 보내라고 ㅅㅂ'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '채팅',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          final chatRoom = chatRooms[index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text(chatRoom['title']!.substring(0, 1)),
                ),
                title: Text(chatRoom['title']!),
                subtitle: Text(
                  chatRoom['message']!,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // 채팅방 클릭 시 상세 채팅 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreens(chatRoom['title']!),
                    ),
                  );
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
