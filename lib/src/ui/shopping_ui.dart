import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/db/database_crud.dart';
import 'package:iosgsmarket/src/screens/shopping_detail_screens.dart';

class ShoppingUi extends StatefulWidget {
  const ShoppingUi({super.key});

  @override
  _ShoppingUiState createState() => _ShoppingUiState();
}

class _ShoppingUiState extends State<ShoppingUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '쇼핑하기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: ProductDatabase.instance.readAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('등록된 상품이 없습니다.'));
          }

          final products = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2 / 3,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                bool isWished = product['isWished'] == 1;

                // null 체크: null일 경우 기본값을 설정
                final productName = product['name'] ?? '이름 없음';
                final productPrice = product['price'] ?? 0; // 가격 기본값 설정

                return GestureDetector(
                  onTap: () {
                    // 상품 상세 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShoppingDetailPage(product: product),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productName, // null 체크된 값 사용
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₩$productPrice', // null 체크된 가격 사용
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: Icon(
                              isWished ? Icons.favorite : Icons.favorite_border,
                              color: isWished ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              // 찜 상태 변경
                              setState(() {
                                // 찜 상태 반전
                                isWished = !isWished;
                              });

                              ProductDatabase.instance.updateProduct({
                                'id': product['id'],
                                'name': product['name'],
                                'description': product['description'],
                                'price': product['price'],
                                'image': product['image'],
                                'isWished': isWished ? 1 : 0, // 찜 상태 반전
                              });

                              // FutureBuilder가 다시 데이터를 가져오도록 유도
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
