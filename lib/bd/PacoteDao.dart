import '../../domain/cardfavs.dart';
import 'db_helper.dart';
import 'package:sqflite/sqflite.dart';




class PacoteDao {
  Future<List<Cardfavorito>> listarcards() async {


    Database database = await DBHelper().initDB();




    String sql = 'SELECT * FROM card;';
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
      'card',
      pacote.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}