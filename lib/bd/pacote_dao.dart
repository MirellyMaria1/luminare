import 'package:untitled3/bd/db_helper.dart';
import 'package:untitled3/domain/register.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM REGISTER;';
    var result = await database.rawQuery(sql);

    List<PacoteTuristico> lista = [];
    for (var json in result) {
      Cadastro register = Cadastro.fromJson(json);
      lista.add(register);
    }

    return lista;
  }
  saveUser(Register register) async {
    Database database = await DBHelper().initDB();
    database.insert('REGISTER', register.toJson());
}