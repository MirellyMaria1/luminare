import 'package:untitled3/bd/DBHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled3/domain/cardfavs.dart';

class PacoteDao {
  Future<List<Cardfavorito>> listarcards() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM Cardfavorito;';
    var result = await database.rawQuery(sql);

    List<Cardfavorito> lista = [];
    for (var json in result) {
      Cardfavorito card = Cardfavorito.fromJson(json);
      lista.add(card);
    }

    return lista;
  }

  Future<void> salvarPacote(Cardfavorito pacote) async {
    Database database = await DBHelper().initDB();

    await database.insert(
      'Cardfavorito',
      pacote.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
