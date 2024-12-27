import 'package:flutter/material.dart';

class AlarmScreens extends StatefulWidget {
  const AlarmScreens({super.key});

  @override
  State<AlarmScreens> createState() => _AlarmScreensState();
}

class _AlarmScreensState extends State<AlarmScreens> {
  // 샘플 알람 데이터
  final List<Map<String, dynamic>> _alarms = [
    {
      'title': '상품이 판매되었습니다!',
      'content': '판매 중이던 "중고 노트북"이 판매되었습니다.',
      'time': '10분 전',
      'isRead': false,
    },
    {
      'title': '새로운 채팅이 도착했습니다.',
      'content': '"아이폰 13" 구매 문의가 왔습니다.',
      'time': '30분 전',
      'isRead': false,
    },
    {
      'title': '상품이 관심 목록에 추가되었습니다.',
      'content': '"중고 자전거"가 5명이 관심을 보였습니다.',
      'time': '1시간 전',
      'isRead': true,
    },
  ];

  // 읽음 상태 업데이트 함수
  void _markAsRead(int index) {
    setState(() {
      _alarms[index]['isRead'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알람'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _alarms.length,
        itemBuilder: (context, index) {
          final alarm = _alarms[index];
          return ListTile(
            leading: Icon(
              alarm['isRead']
                  ? Icons.notifications
                  : Icons.notifications_active,
              color: alarm['isRead'] ? Colors.grey : Colors.blue,
            ),
            title: Text(
              alarm['title'],
              style: TextStyle(
                fontWeight:
                    alarm['isRead'] ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Text(alarm['content']),
            trailing: Text(
              alarm['time'],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () => _markAsRead(index), // 클릭 시 읽음 처리
          );
        },
      ),
    );
  }
}
