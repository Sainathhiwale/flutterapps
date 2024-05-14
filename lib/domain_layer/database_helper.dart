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
            useremail TEXT NOT NULL ,
            password TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int?> insertUser(User user) async {
    final db = await database!;
    final id = await db?.insert(_usersTable, user.toMap());
    return id;
  }

  Future<User?> getUser(String useremail,String password) async {
    final db = await database!;

    // Combine username and password conditions using AND operator
    final whereClause = 'useremail = ? AND password = ?';
    final whereArgs = [useremail, password];

    final maps = await db?.query(
      _usersTable,
      where: whereClause,
      whereArgs: whereArgs,
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
