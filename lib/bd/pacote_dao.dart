import 'package:untitled3/bd/db_helper.dart';
import 'package:untitled3/domain/register.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {

  saveRegister(Register register) async {
    Database database = await DBHelper().initDB();
    database.insert('CADASTRO', register.toJson());
  }

  autenticar(String username, String password) async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM CADASTRO '
        'WHERE email = ? '
        'AND PASSWORD = ?;';

    var result = await database.rawQuery(sql, [username, password]);
    print(result);

    return result.isNotEmpty;
  }
}