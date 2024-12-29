import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/db/database_crud.dart';
import 'package:sqflite/sqflite.dart';

class WritingUi extends StatelessWidget {
  const WritingUi({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '상품 등록',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '상품 이미지',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // 이미지 업로드 로직 추가
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.add_a_photo, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '상품 이름',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '상품 이름을 입력하세요',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '가격',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '가격을 입력하세요',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '상품 설명',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '상품 설명을 입력하세요',
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      final newProduct = {
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'price': int.parse(priceController.text),
                        'isWished': false, // 기본적으로 찜되지 않음
                      };

                      await ProductDatabase.instance.createProduct(newProduct);

                      // 상품 등록 후 메시지 표시
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('상품 등록')),
                      );
                    },
                    child: const Text('상품 등록'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
