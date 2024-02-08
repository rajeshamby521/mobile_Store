import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)",
        );
        await db.execute(
          "CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, price REAL, image TEXT, category TEXT)",
        );
      },
    );
  }

  @override
  Future<void> registerUser(User user) async {
    final db = await database;
    await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<User?> loginUser(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users',
        where: 'username = ? AND password = ?', whereArgs: [username, password]);
    if (maps.isEmpty) {
      return null;
    } else {
      return User.fromMap(maps.first);
    }
  }
}