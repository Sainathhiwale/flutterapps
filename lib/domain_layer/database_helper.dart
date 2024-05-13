import 'package:flutterapps/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _databaseName = 'users.db';
  static const String _usersTable = 'users';

  Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_usersTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> insertUser(User user) async {
    final db = await database!;
    await db?.insert(_usersTable, user.toMap());
  }

  Future<User?> getUser(String username) async {
    final db = await database!;
    final maps = await db?.query(
      _usersTable,
      where: 'username = ?',
      whereArgs: [username],
    );
    if (maps!.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}



extension UserExtension on User {
  Map<String, dynamic> toMap() => {'username': username, 'password': password};

  static User fromMap(Map<String, dynamic> map) => User(
        id: map['id'] as int,
        username: map['username'] as String,
      useremail: map['useremail'] as String,
        password: map['password'] as String,
      );
}
