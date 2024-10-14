import 'package:iosgsmarket/src/model/sample.dart';
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
    String path = join(dataBasePath, 'sample.db');
    _database = await openDatabase(path, version: 1, onCreate: _databaseCreate);
  }

  void _databaseCreate(Database db, int version) async {
    await db.execute('''
      create table ${Sample.tableName}(
        ${SampleFields.id} integer primary key autoincrement,
        ${SampleFields.name} text not null,
        ${SampleFields.yn} integer not null,
        ${SampleFields.value} double not null,
        ${SampleFields.createdAt} text not null
      )
    ''');
  }

  void closeDataBase() async {
    if (_database != null) await _database!.close();
  }
}
