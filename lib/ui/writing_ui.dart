import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/model/product.dart';
import 'package:iosgsmarket/src/repo/sql_product_crud.dart';

class WritingWidget extends StatefulWidget {
  const WritingWidget({super.key});

  @override
  State<WritingWidget> createState() => _WritingWidgetState();
}

class _WritingWidgetState extends State<WritingWidget> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _postProduct() async {
    // 입력된 값 가져오기
    String title = _titleController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String description = _descriptionController.text;

    if (title.isEmpty || price <= 0 || description.isEmpty) {
      // 유효성 검사 실패 시 SnackBar 표시
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필드를 정확히 입력하세요.')),
      );
      return;
    }

    // 새로운 Product 객체 생성
    Product newProduct = Product(
      name: title,
      price: price,
      description: description,
      createdAt: DateTime.now(),
      isSold: false, // 새 상품은 기본적으로 '판매 중' 상태
    );

    // DB에 저장
    await SqlProductCrud.create(newProduct);

    // 게시 성공 SnackBar 표시
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('상품이 성공적으로 게시되었습니다.')),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "내 물건 팔기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "사진 추가",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "제목",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '제목을 입력하세요.',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "가격",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '가격을 입력하세요.',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                "상세 설명",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '상품에 대한 자세한 설명을 입력하세요.',
                ),
                minLines: 5,
                maxLines: 10,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _postProduct,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(0), // 패딩 제거로 Ink에서 여백 조정
                        elevation: 8, // 더 높은 그림자 효과
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.grey, Colors.black],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 4), // 그림자 위치 조정
                              blurRadius: 10, // 그림자 부드럽게
                            ),
                          ],
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 390,
                            minHeight: 60,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "게시",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20, // 약간 큰 텍스트
                              fontWeight: FontWeight.w600, // 텍스트 굵게
                              letterSpacing: 1.2, // 자간 조정
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(0),
                        elevation: 8,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.black, Colors.grey],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 390,
                            minHeight: 60,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "임시 저장",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
