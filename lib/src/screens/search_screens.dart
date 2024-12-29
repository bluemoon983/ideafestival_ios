import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/db/database_crud.dart';
import 'package:sqflite/sqflite.dart';

class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});

  @override
  State<SearchScreens> createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredProducts = [];

  // 검색어가 변경될 때마다 호출되는 함수
  void _searchProducts(String query) async {
    if (query.isEmpty) {
      filteredProducts = await ProductDatabase.instance.readAllProducts();
    } else {
      filteredProducts = await ProductDatabase.instance.searchProducts(query);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: '검색어를 입력하세요',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              onChanged: _searchProducts, // 검색어 변경 시 호출
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredProducts.isEmpty
                  ? const Center(child: Text('검색 결과가 없습니다.'))
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.image, color: Colors.grey),
                          ),
                          title: Text(product['name']),
                          subtitle: Text('₩${product['price']}'),
                          onTap: () {
                            // 상품 상세 페이지로 이동하거나 다른 작업을 추가할 수 있음
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
