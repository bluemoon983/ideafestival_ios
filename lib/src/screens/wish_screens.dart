import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/db/database_crud.dart';
import 'package:sqflite/sqflite.dart';

class WishScreens extends StatefulWidget {
  const WishScreens({super.key});

  @override
  State<WishScreens> createState() => _WishScreensState();
}

class _WishScreensState extends State<WishScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("찜한 상품"),
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
            return const Center(child: Text('찜한 상품이 없습니다.'));
          }

          final wishItems = snapshot.data!
              .where((product) => product['isWished'] == true)
              .toList();

          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: wishItems.length,
            itemBuilder: (context, index) {
              final item = wishItems[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    item['isWished'] = !item['isWished'];
                    ProductDatabase.instance.updateProduct(item);
                  });
                },
                child: Card(
                  elevation: 3.0,
                  child: Column(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
