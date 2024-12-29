import 'package:flutter/material.dart';

class TradeScreens extends StatelessWidget {
  const TradeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // 샘플 거래 내역 데이터
    final List<Map<String, String>> tradeData = [
      {'title': '아이패드 판매', 'date': '2024-12-28', 'price': '500,000원'},
      {'title': '책 구매', 'date': '2024-12-27', 'price': '10,000원'},
      {'title': '이어폰 판매', 'date': '2024-12-25', 'price': '30,000원'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('거래 내역'),
      ),
      body: ListView.builder(
        itemCount: tradeData.length,
        itemBuilder: (context, index) {
          final item = tradeData[index];
          return ListTile(
            title: Text(item['title'] ?? ''),
            subtitle: Text(item['date'] ?? ''),
            trailing: Text(item['price'] ?? ''),
            onTap: () {
              // 거래 세부 정보를 표시하거나 행동을 추가할 수 있음
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(item['title'] ?? ''),
                  content: Text('거래 날짜: ${item['date']}\n가격: ${item['price']}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('닫기'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
