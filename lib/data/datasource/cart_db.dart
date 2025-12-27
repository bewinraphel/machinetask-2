 
 
 
import 'package:machinetask/data/models/cart_item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
 

class CartDb {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  static Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'cart.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE cart(
            id INTEGER PRIMARY KEY,
            name TEXT,
            image TEXT,
            price REAL,
            quantity INTEGER,
            savedForLater INTEGER
          )
        ''');
      },
    );
  }

  static Future<List<CartItemModel>> fetchItems() async {
    final db = await database;
    final result = await db.query('cart');
    return result.map(CartItemModel.fromMap).toList();
  }

  static Future<void> insertItem(CartItemModel item) async {
    final db = await database;
    await db.insert(
      'cart',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteItem(int id) async {
    final db = await database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> clear() async {
    final db = await database;
    await db.delete('cart');
  }
}
