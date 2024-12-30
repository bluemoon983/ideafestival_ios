import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductDatabase {
  static final ProductDatabase instance = ProductDatabase._init();
  static Database? _database;

  ProductDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('products.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE products (
      id $idType,
      name $textType,
      description $textType,
      price $intType,
      isWished $boolType
    )
    ''');
  }

  Future<int> createProduct(Map<String, dynamic> product) async {
    final db = await instance.database;
    return await db.insert('products', product);
  }

  Future<int> updateProduct(Map<String, dynamic> product) async {
    final db = await instance.database;
    return await db.update(
      'products',
      product,
      where: 'id = ?',
      whereArgs: [product['id']],
    );
  }

  Future<int> deleteProduct(int id) async {
    final db = await instance.database;
    return await db.delete(
      'products', // 테이블 이름
      where: 'id = ?', // 조건
      whereArgs: [id], // 조건에 해당하는 값
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<Map<String, dynamic>>> searchProducts(String query) async {
    final db = await instance.database;
    return await db.query(
      'products',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
  }

  Future<List<Map<String, dynamic>>> readAllProducts() async {
    final db = await instance.database;
    final result = await db.query('products');

    // null 체크 후 반환
    return result.map((product) {
      return {
        'id': product['id'] ?? 0, // null일 경우 기본값 0
        'name': product['name'] ?? '이름 없음', // null일 경우 기본값 '이름 없음'
        'price': product['price'] ?? 0, // null일 경우 기본값 0
        'description': product['description'] ?? '설명 없음',
        'image': product['image'] ?? '',
        'isWished': product['isWished'] ?? 0,
      };
    }).toList();
  }
}
