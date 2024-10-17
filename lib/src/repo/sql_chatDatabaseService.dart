import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class SqlChatdatabaseservice {
  static final SqlChatdatabaseservice _instance =
      SqlChatdatabaseservice._internal();
  static Database? _database;

  factory SqlChatdatabaseservice() {
    return _instance;
  }

  SqlChatdatabaseservice._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'chat_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE messages (
            id TEXT PRIMARY KEY,
            text TEXT,
            authorId TEXT,
            createdAt INTEGER
          )
        ''');
      },
    );
  }

  // 메시지 삽입
  Future<void> insertMessage(types.TextMessage message) async {
    final db = await database;
    await db.insert('messages', {
      'id': message.id,
      'text': message.text,
      'authorId': message.author.id,
      'createdAt': message.createdAt,
    });
  }

  // 모든 메시지 가져오기
  Future<List<types.TextMessage>> getMessages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('messages');

    return List.generate(maps.length, (i) {
      return types.TextMessage(
        id: maps[i]['id'],
        text: maps[i]['text'],
        author: types.User(id: maps[i]['authorId']),
        createdAt: maps[i]['createdAt'],
      );
    });
  }
}
