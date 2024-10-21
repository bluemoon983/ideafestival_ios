import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatDatabase {
  static final ChatDatabase _instance = ChatDatabase._internal();
  static Database? _database;

  factory ChatDatabase() {
    return _instance;
  }

  ChatDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'chat.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messages(
            id TEXT PRIMARY KEY,
            text TEXT,
            author_id TEXT,
            created_at INTEGER,
            chat_id TEXT  
          )
        ''');
      },
    );
  }

  // 메시지 저장 시 chat_id 필드를 추가하여 특정 사용자에게 속한 메시지로 저장
  Future<void> insertMessage(types.TextMessage message, String chatId) async {
    final db = await database;
    await db.insert('messages', {
      'id': message.id,
      'text': message.text,
      'author_id': message.author.id,
      'created_at': message.createdAt,
      'chat_id': chatId,
    });
  }

  // 특정 chat_id에 해당하는 메시지만 가져오는 함수
  Future<List<types.TextMessage>> getMessages(String chatId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('messages', where: 'chat_id = ?', whereArgs: [chatId]);

    return List.generate(maps.length, (i) {
      return types.TextMessage(
        id: maps[i]['id'],
        text: maps[i]['text'],
        author: types.User(id: maps[i]['author_id']),
        createdAt: maps[i]['created_at'],
      );
    });
  }
}
