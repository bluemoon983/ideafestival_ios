import 'package:iosgsmarket/src/model/product.dart';
import 'package:iosgsmarket/src/repo/sql_database.dart';

class SqlProductCrud {
  // Create
  static Future<Product> create(Product product) async {
    var db = await SqlDatabase().database;
    var id = await db.insert(Product.tableName, product.toJson());
    return product.copyWith(id: id);
  }

  // Read all
  static Future<List<Product>> getList() async {
    var db = await SqlDatabase().database;
    var result = await db.query(Product.tableName);
    return result.map((data) => Product.fromJson(data)).toList();
  }

  // Read by ID
  static Future<Product?> getProductById(int id) async {
    var db = await SqlDatabase().database;
    var result =
        await db.query(Product.tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Product.fromJson(result.first);
    }
    return null;
  }

  // Update
  static Future<int> update(Product product) async {
    var db = await SqlDatabase().database;
    return await db.update(
      Product.tableName,
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  // Delete
  static Future<int> delete(int id) async {
    var db = await SqlDatabase().database;
    return await db.delete(Product.tableName, where: 'id = ?', whereArgs: [id]);
  }

  // **Search** 기능 추가
  static Future<List<Product>> searchProducts(String query) async {
    var db = await SqlDatabase().database;

    // LIKE 쿼리를 사용하여 이름에 검색어가 포함된 상품 검색
    var result = await db.query(
      Product.tableName,
      where: 'name LIKE ?', // name 필드에서 부분 검색
      whereArgs: ['%$query%'], // 검색어 앞뒤로 %를 붙여 부분 일치 검색
    );

    if (result.isNotEmpty) {
      return result.map((data) => Product.fromJson(data)).toList();
    } else {
      return [];
    }
  }
}
