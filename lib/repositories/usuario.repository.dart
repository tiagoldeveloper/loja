import 'package:loja/models/usuario.model.dart';
import 'package:loja/repositories/app.repository.dart';
import 'package:loja/settings/settings.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioRepository {
  Future grava(Usuario usuario) async {
    try {
      final Database db = await AppBase().connection();
      var insert = await db.insert(
        TB_USUARIO,
        usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print(insert);
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<Usuario> logar(String email, String senha) async {
    try {
      final Database db = await AppBase().connection();
      final List<Map<String, dynamic>> maps = await db.query(
        TB_USUARIO,
        where: "email = ? and senha = ?",
        whereArgs: [email, senha],
      );
      return Usuario(
        id: maps[0]['id'],
        nome: maps[0]['nome'],
        email: maps[0]['email'],
        senha: maps[0]['senha'],
      );
    } catch (ex) {
      return new Usuario();
    }
  }

  Future update(Usuario usuario) async {
    try {
      final Database db = await AppBase().connection();

      await db.update(
        TB_USUARIO,
        usuario.toMap(),
        where: "id = ?",
        whereArgs: [usuario.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<Usuario>> getUsuarios() async {
    try {
      final Database db = await AppBase().connection();
      final List<Map<String, dynamic>> maps = await db.query(TB_USUARIO);

      return List.generate(
        maps.length,
        (i) {
          return Usuario(
            id: maps[i]['id'],
            nome: maps[i]['nome'],
            email: maps[i]['email'],
            senha: maps[i]['senha'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<Usuario>();
    }
  }

  Future delete(int id) async {
    try {
      final Database db = await AppBase().connection();
      await db.delete(
        TB_USUARIO,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
