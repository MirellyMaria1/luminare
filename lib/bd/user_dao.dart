import 'package:untitled3/bd/db_helper.dart';
import 'package:untitled3/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  saveUser(Register register) async {
    Database database = await DBHelper().initDB();
    database.insert('REGISTER', register.toJson());
  }

  autenticar(String username, String password) async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM USER '
        'WHERE USERNAME = ? '
        'AND PASSWORD = ?;';

    var result = await database.rawQuery(sql, [username, password]);

    return result.isNotEmpty;
  }
}