import 'package:iosgsmarket/src/model/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDatabase {
  static final SqlDatabase instance = SqlDatabase._instance();

  Database? _database;

  SqlDatabase._instance() {
    _initDatabase();
  }

  factory SqlDatabase() {
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    await _initDatabase();
    return _database!;
  }

  Future<void> _initDatabase() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'product.db');
    _database = await openDatabase(path, version: 1, onCreate: _databaseCreate);
  }

  void _databaseCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${Product.tableName}(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price DOUBLE NOT NULL,
        description TEXT NOT NULL,
        isSold INTEGER NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  void closeDataBase() async {
    if (_database != null) await _database!.close();
  }
}
