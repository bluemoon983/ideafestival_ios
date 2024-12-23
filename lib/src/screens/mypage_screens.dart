import 'package:flutter/material.dart';

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
                      '사용자 이름',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '이메일@example.com',
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
                // 거래 내역 화면으로 이동
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              leading: const Icon(Icons.favorite),
              title: const Text('찜한 상품'),
              onTap: () {
                // 찜한 상품 화면으로 이동
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              leading: const Icon(Icons.settings),
              title: const Text('설정'),
              onTap: () {
                // 설정 화면으로 이동
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              leading: const Icon(Icons.logout),
              title: const Text("로그아웃"),
              onTap: () {},
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
