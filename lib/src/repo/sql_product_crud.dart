import 'package:iosgsmarket/src/model/product.dart';
import 'package:iosgsmarket/src/repo/sql_database.dart';

class SqlProductCrud {
  static Future<Product> create(Product product) async {
    var db = await SqlDatabase().database;
    var id = await db.insert(Product.tableName, product.toJson());
    return product.copyWith(id: id);
  }

  static Future<List<Product>> getList() async {
    var db = await SqlDatabase().database;
    var result = await db.query(Product.tableName);
    return result.map((data) => Product.fromJson(data)).toList();
  }

  static Future<Product?> getProductById(int id) async {
    var db = await SqlDatabase().database;
    var result =
        await db.query(Product.tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Product.fromJson(result.first);
    }
    return null;
  }

  static Future<int> update(Product product) async {
    var db = await SqlDatabase().database;
    return await db.update(
      Product.tableName,
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  static Future<int> delete(int id) async {
    var db = await SqlDatabase().database;
    return await db.delete(Product.tableName, where: 'id = ?', whereArgs: [id]);
  }
}
