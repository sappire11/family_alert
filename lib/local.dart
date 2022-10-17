import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class AppDB {
  static final AppDB db = AppDB();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await openDb();
    return _database!;
  }

  Future openDb() async {
    // 獲取我們的應用程序目錄的位置。這是我們應用程序文件的存儲位置，並且僅存儲我們的應用程序文件。
    // 當應用被刪除時，此目錄中的文件也會被刪除。
    return await openDatabase(join(await getDatabasesPath(), 'qi.db'),
      version: 1,
      onOpen: (db) async {}, onCreate: (Database db, int version) async {

        await db.execute(
            "CREATE TABLE IF NOT EXISTS setting(id INTEGER PRIMARY KEY AUTOINCREMENT,key TEXT,value TEXT)");
        await db.execute(
        "CREATE TABLE IF NOT EXISTS account(id INTEGER PRIMARY KEY AUTOINCREMENT,useraccount TEXT,userpassword TEXT)");
      },

    );
  }
  Future insertSetting(key,value) async {
    final db = await database;
    print('輸入');
    Map<String, dynamic> row = {
      "key" : key,
      "value"  : value
    };


    return db.insert('setting', row);
  }

  Future updateSetting(key,value) async {
    final db = await database;
    print('輸出');
    Map<String, dynamic> row = {
      "key" : key,
      "value"  : value
    };
    return db
        .update('setting', row, where: "key = ?", whereArgs: [key]);
  }

  Future<List<Map<String, dynamic>>> getSetting(key) async {
    final db = await database;
    // return db.query('setting' );
    return db.rawQuery('SELECT value FROM setting WHERE  key = ?',  [key]);

  }
  
  
//--
  Future insertAccount(account,password) async {
    final db = await database;
    print('輸入');
    Map<String, dynamic> row = {
      "useraccount" : account,
      "userpassword"  : password,

    };


    return db.insert('account', row);
  }

  Future updateAccount(account,password) async {
    final db = await database;
    print('輸出');
    Map<String, dynamic> row = {
      "useraccount" : account,
      "userpassword"  : password,
      // "usermail":mail,
    };
    return db
        .update('account', row, where: "useraccount = ?", whereArgs: [account]);
  }

  Future<List<Map<String, dynamic>>> getAccount(key) async {
    final db = await database;
    // return db.query('setting' );+

    return db.rawQuery('SELECT * FROM account WHERE  useraccount = ?',  [key]);

  }
  Future<List<Map<String, dynamic>>> login(ac,pw) async {
    final db = await database;
    // return db.query('setting' );+

    return db.rawQuery('SELECT * FROM account WHERE  useraccount =? AND userpassword = ?',  [ac,pw]);

  }


}

