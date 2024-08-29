import 'package:flutter/material.dart';

class AlarmScreens extends StatelessWidget {
  // 알림 목록 (예시 데이터)
  final List<String> notifications = [
    "이세민의 키보드가 판매되었습니다.",
    "김담율의 핸드폰에 댓글이 달렸습니다.",
    "함성우의 게임기를 찜했습니다",
  ];

  AlarmScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "알림",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.black),
              title: Text(
                notifications[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // 알림 항목 클릭 시 동작
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("알림"),
                      content: Text(notifications[index]),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("확인"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
