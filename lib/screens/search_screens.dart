import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/detail_view.dart';
import 'package:iosgsmarket/src/model/product.dart';
import 'package:iosgsmarket/src/repo/sql_product_crud.dart';

class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});

  @override
  _SearchScreensState createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  final _searchController = TextEditingController();
  Product? _searchResult;

  Future<void> _searchProduct(String query) async {
    // 검색어로 DB 조회
    List<Product> products = await SqlProductCrud.searchProducts(query);

    // 검색 결과가 있을 경우
    if (products.isNotEmpty) {
      setState(() {
        _searchResult = products.first; // 가장 유사한 상품을 결과로 설정
      });

      // 상세 페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailView(product: _searchResult!),
        ),
      );
    } else {
      // 검색 결과가 없을 경우
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('검색 결과가 없습니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Hero(
          tag: "titlename",
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            return ScaleTransition(
              scale: animation.drive(
                Tween(begin: 0.9, end: 1.0)
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: Material(
                color: Colors.transparent,
                child: toHeroContext.widget,
              ),
            );
          },
          child: const Material(
            color: Colors.transparent,
            child: Text(
              "GSMarket",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              // Hero with Custom Animation
              Hero(
                tag: "searchBarHero",
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                      scale: animation.drive(
                        Tween(begin: 0.8, end: 1.0)
                            .chain(CurveTween(curve: Curves.easeInOut)),
                      ),
                      child: toHeroContext.widget,
                    ),
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  child: TextField(
                    controller: _searchController, // 검색어 입력 필드
                    onSubmitted: (query) {
                      _searchProduct(query); // 검색어 제출 시 검색 수행
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: "검색.... ",
                      hintStyle:
                          TextStyle(color: Colors.black54, fontSize: 16.0),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
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
