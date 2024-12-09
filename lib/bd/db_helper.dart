import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'register.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  FutureOr<void> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE CADASTRO (email varchar(100) PRIMARY KEY, username varchar(100), password  varchar(100));';
    await db.execute(sql);

    sql =
    "INSERT INTO CADASTRO (email, username, password ) VALUES ('mmmp1@aluno.ifal.edu.br', 'Mirelly', '123456');";
    await db.execute(sql);

  }
}