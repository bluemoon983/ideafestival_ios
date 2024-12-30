import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/db/database_crud.dart';

class ShoppingDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ShoppingDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // 상품의 찜 상태
    bool isWished = product['isWished'] == 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상품 이미지
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                product['image'],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // 상품 이름
            Text(
              product['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // 상품 가격
            Text(
              '₩${product['price']}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // 상품 설명
            Text(
              product['description'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            // 찜 버튼
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  isWished ? Icons.favorite : Icons.favorite_border,
                  color: isWished ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  // 찜 상태 변경
                  ProductDatabase.instance.updateProduct({
                    'id': product['id'],
                    'name': product['name'],
                    'description': product['description'],
                    'price': product['price'],
                    'image': product['image'],
                    'isWished': isWished ? 0 : 1, // 찜 상태 반전
                  });

                  // 화면 갱신
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
