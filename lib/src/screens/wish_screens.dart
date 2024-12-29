import 'package:flutter/material.dart';

class WishScreens extends StatefulWidget {
  const WishScreens({super.key});

  @override
  State<WishScreens> createState() => _WishScreensState();
}

class _WishScreensState extends State<WishScreens> {
  // 샘플 데이터 리스트
  final List<Map<String, dynamic>> wishItems = [
    {
      "title": "상품 1",
      "image": "https://via.placeholder.com/150",
      "isWished": true
    },
    {
      "title": "상품 2",
      "image": "https://via.placeholder.com/150",
      "isWished": true
    },
    {
      "title": "상품 3",
      "image": "https://via.placeholder.com/150",
      "isWished": true
    },
    {
      "title": "상품 4",
      "image": "https://via.placeholder.com/150",
      "isWished": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("찜한 상품"),
        centerTitle: true,
      ),
      body: wishItems.isEmpty
          ? const Center(
              child: Text(
                "찜한 상품이 없습니다.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 행에 두 개의 아이템
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75, // 아이템의 가로/세로 비율
              ),
              itemCount: wishItems.length,
              itemBuilder: (context, index) {
                final item = wishItems[index];
                return Card(
                  elevation: 3.0,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.network(
                              item['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              wishItems[index]['isWished'] =
                                  !wishItems[index]['isWished'];
                              if (!wishItems[index]['isWished']) {
                                wishItems.removeAt(index); // 찜 상태가 해제되면 목록에서 제거
                              }
                            });
                          },
                          child: Icon(
                            item['isWished']
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item['isWished'] ? Colors.red : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
