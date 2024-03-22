import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper dbHero = DBHelper._secretDBConstructor();
  static Database? _database;
  DBHelper._secretDBConstructor();

  Future<Database> get dataBase async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'db_1.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate:
      _createDatabase,
    );
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        deadLine TEXT,
        priority INTEGER
      )
    ''');
  }

// Insert data into the database
  Future<int> insertDb(Map<String, dynamic> row) async {
    Database db = await dbHero.dataBase;
    return await db.insert('todos', row);
  }

  Future<List<Map<String, dynamic>>> readDb() async {
    Database db = await dbHero.dataBase;
    return await db.query('todos');
  }

  Future<int> updateDb(Map<String, dynamic> row) async {
    Database db = await dbHero.dataBase;
    int id = row['id'];
    return await db.update('todos', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteDb(int id) async {
    Database db = await dbHero.dataBase;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}