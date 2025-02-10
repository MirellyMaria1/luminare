import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String dbName = 'pacote.db';
  static const String tableName = 'CardFavorito';

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacote1.db');

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE Cardfavorito (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo varchar(100), url_image varchar(100), descricao varchar(100), valor varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO Cardfavorito (titulo, url_image, descricao,  valor) VALUES ('anel', 'https://images.tcdn.com.br/img/img_prod/848976/anel_solitario_em_ouro_18k_com_cristal_azul_safira_1829_1_07fe536714dbff6bc25aaafe579b4068.jpeg', 'banhados a ouro> SEMIJOIAS > BRINCOS > kits de brincos', 'R\$ 199,00');";
    await db.execute(sql);

    sql =
        "INSERT INTO Cardfavorito (titulo, url_image, descricao,  valor) VALUES ('Kit de colares trançados', 'https://down-br.img.susercontent.com/file/c84e22a0ae7163f33fa350942648b024', 'banhados a ouro> SEMIJOIAS > COLARES > kits de colares', 'R\$ 199,00');";
    await db.execute(sql);

    sql =
        "INSERT INTO Cardfavorito (titulo, url_image, descricao,  valor) VALUES ('bracelete cristal multicolor', 'https://www.bwimg.com.br/maisejoias/produtos/pulseira-de-missangas-coloridas-folheada-a-ouro-18k-1637260750.4232.jpg', 'SEMIJOIAS > PULSEIRA > BRACELETE>pedras cravejadas', 'R\$ 199,00');";
    await db.execute(sql);
  }
}
