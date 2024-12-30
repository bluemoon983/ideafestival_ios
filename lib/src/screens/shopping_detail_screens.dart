import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/db/database_crud.dart'; // 데이터베이스 CRUD 클래스

class ShoppingDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ShoppingDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // null 체크: null일 경우 기본값을 제공
    final productName = product['name'] ?? '이름 없음';
    final productPrice = product['price'] ?? 0; // 가격 기본값 설정
    final productDescription = product['description'] ?? '설명 없음';
    final productImage = product['image'] ?? ''; // 이미지 기본값 설정

    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        actions: [
          // 삭제 버튼
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              // 상품 삭제
              await ProductDatabase.instance.deleteProduct(product['id']);

              // 삭제 후 이전 화면으로 돌아가기
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              productName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '₩$productPrice',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              productDescription,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
