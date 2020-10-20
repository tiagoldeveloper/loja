import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja/android/pessoas/pessoa.con.page.dart';
import 'package:loja/android/pessoas/pessoa.itens.page.dart';
import 'package:loja/models/pessoa.model.dart';
import 'package:loja/android/pessoas/pessoa.page.dart';
import 'package:loja/controllers/pessoa.controller.dart';

class PessoasPage extends StatefulWidget {
  @override
  _PessoasPageState createState() => _PessoasPageState();
}

class _PessoasPageState extends State<PessoasPage> {
  final controller = PessoaController();

  @override
  void initState() {
    super.initState();
    controller.search("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: PessoaConPage(controller: controller),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: controller.pessoas.length,
          itemBuilder: (ctx, i) {
            return PessoaItensPage(
              pessoa: controller.pessoas[i],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PessoaCadastroPage(
                pessoa: PessoaModel(id: 0),
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
