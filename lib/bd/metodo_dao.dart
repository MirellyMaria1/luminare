
import 'package:sqflite/sqflite.dart';
import 'package:untitled3/bd/db_helper.dart';
import 'package:untitled3/domain/metodop.dart';


class MetodoDao {
  saveAddress(Metodo metodo) async {
    Database database = await DBHelper().initDB();
    database.insert('Metodo', metodo.toJson());
  }

  listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM METODO;';
    var result = await database.rawQuery(sql);

    List<Metodo> lista = [];
    for (var json in result) {
      Metodo metodo = Metodo.fromJson(json);
      lista.add(metodo);
    }

    return lista;
  }
}
