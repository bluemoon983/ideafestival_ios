import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  static const TextStyle titleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "채팅",
                style: titleStyle,
              ),
            ),
            SizedBox(height: 20), // 텍스트와 다음 요소 사이에 간격 추가
            // 여기에 추가적인 위젯을 배치할 수 있습니다.
          ],
        ),
      ),
    );
  }
}
