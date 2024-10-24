import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/detail_view.dart';
import 'package:iosgsmarket/src/model/product.dart';
import 'package:iosgsmarket/src/repo/sql_product_crud.dart';
import 'package:iosgsmarket/src/util/data.dart';

class ShoppingUi extends StatefulWidget {
  const ShoppingUi({super.key});

  @override
  State<ShoppingUi> createState() => _ShoppingUiState();
}

class _ShoppingUiState extends State<ShoppingUi> {
  void createdRandomProduct() async {
    var value = Data.randomValue();
    var product = Product(
      name: '상품 ${Data.makeUUID()}',
      price: value,
      description: '랜덤 상품 설명',
      isSold: value % 2 == 0,
      createdAt: DateTime.now(),
    );

    await SqlProductCrud.create(product);
    update();
  }

  void update() => setState(() {});

  Widget _productItem(Product product) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(product: product),
          ),
        );
        update();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(product.name, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 7),
            Text('\$${product.price}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 7),
            Text(product.createdAt.toIso8601String(),
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 7),
            Text(product.isSold ? 'Sold' : 'Available',
                style: TextStyle(
                    color: product.isSold ? Colors.red : Colors.green)),
          ],
        ),
      ),
    );
  }

  Future<List<Product>> _loadProductList() async {
    return await SqlProductCrud.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "중고 거래",
              style: TextStyle(fontSize: 39),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: _loadProductList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            var products = snapshot.data;
            return ListView(
              children: List.generate(
                  products!.length, (index) => _productItem(products[index])),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
