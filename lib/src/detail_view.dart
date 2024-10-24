import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/model/product.dart';
import 'package:iosgsmarket/src/repo/sql_product_crud.dart';
import 'package:iosgsmarket/src/util/data.dart';

class DetailView extends StatefulWidget {
  final Product product;
  const DetailView({super.key, required this.product});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Future<Product?> _loadProduct() async {
    return SqlProductCrud.getProductById(widget.product.id!);
  }

  void update(Product product) async {
    double newPrice = Data.randomValue();
    var updatedProduct =
        product.copyWith(price: newPrice, isSold: newPrice.toInt() % 2 == 0);
    await SqlProductCrud.update(updatedProduct);
    setState(() {});
  }

  void delete(Product product) async {
    await SqlProductCrud.delete(product.id!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<Product?>(
          future: _loadProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child:
                    Text("Not Found Data for Product ID: ${widget.product.id}"),
              );
            }

            if (snapshot.hasData) {
              var product = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Name: ${product.name}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Price: \$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Description: ${product.description}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Status: ${product.isSold ? 'Sold' : 'Available'}',
                    style: TextStyle(
                        fontSize: 16,
                        color: product.isSold ? Colors.red : Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Created At: ${product.createdAt.toIso8601String()}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      update(product);
                    },
                    child: const Text(
                      'Update Price',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete(product);
                    },
                    child: const Text(
                      'Delete Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
