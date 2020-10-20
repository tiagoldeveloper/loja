import 'package:loja/models/pessoa.model.dart';
import 'package:loja/repositories/app.repository.dart';
import 'package:loja/settings/settings.dart';
import 'package:sqflite/sqflite.dart';

class PessoaRepository {
  Future grava(PessoaModel pessoa) async {
    try {
      final Database db = await AppBase().open();
      var insert = await db.insert(
        TB_PESSOA,
        pessoa.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print(insert);
    } catch (ex) {
      print("============log=============");
      print(ex);
      return;
    }
  }

  Future<List<PessoaModel>> search(String term) async {
    try {
      final Database db = await AppBase().open();
      final List<Map<String, dynamic>> maps = await db.query(
        TB_PESSOA,
        where: "nome LIKE ?",
        whereArgs: [
          '%$term%',
        ],
      );
      return List.generate(
        maps.length,
        (i) {
          return PessoaModel(
            id: maps[i]['id'],
            nome: maps[i]['nome'],
            cpf: maps[i]['cpf'],
            celular: maps[i]['celular'],
            telefone: maps[i]['telefone'],
            email: maps[i]['email'],
            cep: maps[i]['cep'],
            numero: maps[i]['numero'],
            rua: maps[i]['rua'],
            bairro: maps[i]['bairro'],
            cidade: maps[i]['cidade'],
            uf: maps[i]['uf'],
            tipoPessoa: maps[i]['tipoPessoa'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<PessoaModel>();
    }
  }

  Future update(PessoaModel pessoa) async {
    try {
      final Database db = await AppBase().open();

      await db.update(
        TB_PESSOA,
        pessoa.toMap(),
        where: "id = ?",
        whereArgs: [pessoa.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<PessoaModel> get(int id) async {
    try {
      final Database db = await AppBase().open();
      final List<Map<String, dynamic>> maps = await db.query(
        TB_PESSOA,
        where: "id = ?",
        whereArgs: [id],
      );
      return PessoaModel(
        id: maps[0]['id'],
        nome: maps[0]['nome'],
        cpf: maps[0]['cpf'],
        celular: maps[0]['celular'],
        telefone: maps[0]['telefone'],
        email: maps[0]['email'],
        cep: maps[0]['cep'],
        numero: maps[0]['numero'],
        rua: maps[0]['rua'],
        bairro: maps[0]['bairro'],
        cidade: maps[0]['cidade'],
        uf: maps[0]['uf'],
        tipoPessoa: maps[0]['tipo_pessoa'],
      );
    } catch (ex) {
      print(ex);
      return new PessoaModel();
    }
  }

  Future<List<PessoaModel>> all() async {
    try {
      final Database db = await AppBase().open();
      final List<Map<String, dynamic>> maps = await db.query(TB_PESSOA);

      return List.generate(
        maps.length,
        (i) {
          return PessoaModel(
            id: maps[i]['id'],
            nome: maps[i]['nome'],
            cpf: maps[i]['cpf'],
            celular: maps[i]['celular'],
            telefone: maps[i]['telefone'],
            email: maps[i]['email'],
            cep: maps[i]['cep'],
            numero: maps[i]['numero'],
            rua: maps[i]['rua'],
            bairro: maps[i]['bairro'],
            cidade: maps[i]['cidade'],
            uf: maps[i]['uf'],
            tipoPessoa: maps[i]['tipo_pessoa'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<PessoaModel>();
    }
  }

  Future remove(int id) async {
    try {
      final Database db = await AppBase().open();
      await db.delete(
        TB_PESSOA,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
