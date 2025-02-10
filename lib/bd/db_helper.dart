import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'metodo.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );


    return db;
  }


  FutureOr<void> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE METODO (id INTEGER PRIMARY KEY AUTOINCREMENT, nome varchar(100), desconto VARCHAR(100), url_image varchar(100));';
    await db.execute(sql);


    sql =
    "INSERT INTO METODO (id, nome, url_image, desconto) VALUES (1, 'PIX', 'https://i.pinimg.com/originals/46/11/a5/4611a564a1f84d6758472fe7e6483671.png', 'valor total');";
    await db.execute(sql);


    sql =
    "INSERT INTO METODO (id, nome, url_image, desconto) VALUES (2, 'Débito', 'https://cdn-icons-png.flaticon.com/512/3176/3176316.png', '2 vezes sem juros');";
    await db.execute(sql);


    sql =
    "INSERT INTO METODO (id, nome, url_image, desconto) VALUES (3, 'Crédito', 'https://cdn-icons-png.flaticon.com/512/5782/5782919.png', '4 vezes sem juros');";
    await db.execute(sql);


  }
}

