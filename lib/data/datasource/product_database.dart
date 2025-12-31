import 'package:machinetask/models/cart_item_model.dart';
import 'package:machinetask/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProductHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'watchapp.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            image1 TEXT,
            image2 TEXT,
            image3 TEXT,
            price INTEGER,
            quantity INTEGER,
            favourite INTEGER,
            savedForLater INTEGER,
            bestseller INTEGER,
            description TEXT
         )
        ''');
        await db.execute('''
          CREATE TABLE cart(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productId INTEGER,
            name TEXT,
            price INTEGER,
            image TEXT,
            quantity INTEGER
          )
        ''');
        await _insertInitialProducts(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE products ADD COLUMN description TEXT');
        }
      },
    );
  }

  static Future<void> _insertInitialProducts(Database db) async {
    final products = [
      ProductModel(
        id: 1,
        name: 'Bronson Analog watch - For Men FS5852',
        price: 99,
        favourite: false,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 2,
        name: 'Boat Headphones',
        price: 10,
        favourite: true,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 3,
        name: 'Bronson Analog watch - For Men FS5852',
        price: 2499,
        favourite: true,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 4,
        name: 'Mi Power Bank',
        price: 1299,
        favourite: false,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 5,
        name: 'Apple AirPods',
        price: 12999,
        favourite: true,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 6,
        name: 'Samsung Charger',
        price: 799,
        favourite: true,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 7,
        name: 'OnePlus Cable',
        price: 99,
        favourite: false,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 8,
        name: 'Logitech Mouse',
        price: 899,
        favourite: true,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 9,
        name: 'Bronson Analog watch - For Men FS5852',
        price: 999,
        favourite: true,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: false,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
      ProductModel(
        id: 10,
        name: 'Sony Speaker',
        price: 3499,
        favourite: false,
        image1: 'assets/images/watch.jpg',
        image2: 'assets/images/product1.jpeg',
        image3: 'assets/images/product1.jpeg',
        quantity: 10,
        saveForlater: true,
        bestseller: true,
        description:
            'Fastract revoltt FS1|1.83 Dislplay|BT Calling|Fastcharge|110+Spots Models|200+WatchFaces Smartwatch (Black Strap, Free Size)',
      ),
    ];

    for (var product in products) {
      await db.rawInsert(
        'INSERT INTO products(name,image1,image2,image3,price,quantity,favourite,savedForLater,bestseller,description) VALUES(?,?,?,?,?,?,?,?,?,?)',
        [
          product.name,
          product.image1,
          product.image2,
          product.image3,
          product.price,
          product.quantity,
          product.favourite,
          product.saveForlater,
          product.bestseller,
          product.description,
        ],
      );
    }
  }

  static Future<List<ProductModel>> fetchProducts() async {
    final db = await database;
    final result = await db.query('products');

    return result.map(ProductModel.fromMap).toList();
  }

 
  static Future<void> addToCart(ProductModel product) async {
    final db = await database;

    final existing = await db.query(
      'cart',
      where: 'productId = ?',
      whereArgs: [product.id],
    );

    if (existing.isNotEmpty) {
      final currentQty = existing.first['quantity'] as int;
      await db.update(
        'cart',
        {'quantity': currentQty + 1},
        where: 'productId = ?',
        whereArgs: [product.id],
      );
    } else {
      await db.insert('cart', {
        'productId': product.id,
        'name': product.description,
        'price': product.price,
        'image': product.image1,
        'quantity': 1,
      });
    }
  }

  static Future<List<CartModel>> fetchCart() async {
    final db = await database;
    final result = await db.query('cart');
    return result.map(CartModel.fromMap).toList();
  }

  static Future<void> increment(int productId) async {
    final db = await database;
    await db.rawUpdate(
      'UPDATE cart SET quantity = quantity + 1 WHERE productId = ?',
      [productId],
    );
  }

  static Future<void> decrement(int productId) async {
    final db = await database;

    final res = await db.query(
      'cart',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    // Safety check
    if (res.isEmpty) return;

    final int currentQty = res.first['quantity'] as int;

    if (currentQty > 1) {
      await db.rawUpdate(
        'UPDATE cart SET quantity = quantity - 1 WHERE productId = ?',
        [productId],
      );
    } else {
 
      await db.delete('cart', where: 'productId = ?', whereArgs: [productId]);
    }
  }

  static Future<int> totalAmount() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT SUM(price * quantity) AS total FROM cart',
    );
    final total = result.first['total'];

    return total == null ? 0 : total as int;
  }
}
