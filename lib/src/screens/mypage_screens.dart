import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/screens/login_screens.dart';
import 'package:iosgsmarket/src/screens/trade_screens.dart';
import 'package:iosgsmarket/src/screens/user_settings.dart';
import 'package:iosgsmarket/src/screens/wish_screens.dart';

class MypageScreens extends StatelessWidget {
  const MypageScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 섹션
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Damyul',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'ekadbf@example.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),

            // 메뉴 섹션
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              leading: const Icon(Icons.shopping_cart),
              title: const Text('내 거래 내역'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TradeScreens()),
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              leading: const Icon(Icons.favorite),
              title: const Text('찜한 상품'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WishScreens()),
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              leading: const Icon(Icons.settings),
              title: const Text('설정'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserSettings()),
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              leading: const Icon(Icons.logout),
              title: const Text(
                "로그아웃",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreens(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
