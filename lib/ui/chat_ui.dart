import 'package:flutter/material.dart';
import 'package:iosgsmarket/screens/chat_screens.dart';
import 'package:iosgsmarket/widgets/chat_widget.dart';

class ChatUi extends StatelessWidget {
  const ChatUi({super.key});

  static const TextStyle titleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "채팅",
                style: titleStyle,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ChatWidget(
                    name: "김담율",
                    lastMessage: "오늘 ㄱ?",
                    icon: Icons.account_circle_sharp,
                    onTap: () => _navigateTo(
                        context,
                        const ChatScreens(
                          name: "김담율",
                          userId: "kim_damyul", // userId 추가
                        )),
                  ),
                  ChatWidget(
                    name: "박찬울",
                    lastMessage: "나 방",
                    icon: Icons.account_circle_sharp,
                    onTap: () => _navigateTo(
                        context,
                        const ChatScreens(
                          name: "박찬울",
                          userId: "park_chanul", // userId 추가
                        )),
                  ),
                  ChatWidget(
                    name: "이서준",
                    lastMessage: "스나이퍼가 필요해서 니가 좀 도와줘야 겠다",
                    icon: Icons.account_circle_sharp,
                    onTap: () => _navigateTo(
                        context,
                        const ChatScreens(
                          name: "이서준",
                          userId: "lee_seojun", // userId 추가
                        )),
                  ),
                  ChatWidget(
                    name: "함도욱",
                    lastMessage: "310호 ㄱㄱ",
                    icon: Icons.account_circle_sharp,
                    onTap: () => _navigateTo(
                        context,
                        const ChatScreens(
                          name: "함도욱",
                          userId: "ham_dowook", // userId 추가
                        )),
                  ),
                  ChatWidget(
                    name: "이세민",
                    lastMessage: "팩트는 이세민이 건강해지고 있다는 거임",
                    icon: Icons.account_circle_sharp,
                    onTap: () => _navigateTo(
                        context,
                        const ChatScreens(
                          name: "이세민",
                          userId: "lee_semin", // userId 추가
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _navigateTo(BuildContext context, Widget destination) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => destination),
  );
}
