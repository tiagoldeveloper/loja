import 'package:loja/settings/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppBase {
  Future<Database> connection() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DATABASE_LOJA);
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      db.execute(
          "CREATE TABLE IF NOT EXISTS tb_usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, senha TEXT)");
      db.execute(
          "CREATE TABLE IF NOT EXISTS tb_pessoa(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, cpf TEXT, celular TEXT, telefone TEXT, email TEXT, cep TEXT, numero TEXT, rua TEXT, bairro TEXT, cidade TEXT, uf TEXT, tipoPessoa INTEGER)");
    });
    return database;
  }

  Future<Database> open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "loja.db");
    Database database = await openDatabase(path);
    return database;
  }
}
