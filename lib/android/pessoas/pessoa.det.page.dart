import 'package:flutter/material.dart';
import 'package:loja/android/pessoas/pessoa.page.dart';
import 'package:loja/models/pessoa.model.dart';
import 'package:loja/android/pessoas/pessoa.loading.page.dart';
import 'package:loja/repositories/pessoa.repository.dart';
import 'package:loja/rotas/rotas.dart';
import 'package:loja/utils/string.utils.dart';
import 'package:url_launcher/url_launcher.dart';

class PessoaDetalhePage extends StatefulWidget {
  @override
  _PessoaDetalhePageState createState() => _PessoaDetalhePageState();
}

class _PessoaDetalhePageState extends State<PessoaDetalhePage> {
  final _repository = new PessoaRepository();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments;
    return FutureBuilder(
      future: _repository.get(id),
      builder: (ctx, snp) {
        if (snp.hasData) {
          PessoaModel pessoa = snp.data;
          print(pessoa.email);
          return page(context, pessoa);
        } else {
          return LoadingPessoaPage();
        }
      },
    );
  }

  onError() {
    final snackBar = SnackBar(
      content: Text('Ops, algo deu errado!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  editaPessoa(BuildContext context, PessoaModel pessoa) {
    Navigator.of(context).pushReplacementNamed(AppRotas.pessoa);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PessoaCadastroPage(
          pessoa: pessoa,
        ),
      ),
    );
  }

  Widget separador(String value) {
    return Visibility(
      visible: StringUtils.isNotBlank(value),
      child: Divider(
        height: 10,
        indent: 10.0,
        endIndent: 10.0,
        color: Colors.red,
      ),
    );
  }

  remove(int id) {
    _repository.remove(id).then((value) {
      Navigator.of(context).pop();
      //Navigator.of(context).pushReplacementNamed(AppRotas.pessoas);
    }).catchError((_) {
      onError();
    });
  }

  showAlert(BuildContext context, String nome, int id) {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continuaButton = FlatButton(
      child: Text("Continar"),
      onPressed: () async {
        Navigator.of(context).pop();
        _repository.remove(id).then((value) {
          Navigator.of(context).pushReplacementNamed(AppRotas.pessoas);
          //Navigator.of(context).pushReplacementNamed(AppRotas.pessoas);
        }).catchError((_) {
          onError();
        });
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Exclusão"),
      content: Text("Deseja realmente excluir o $nome ?"),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget page(BuildContext context, PessoaModel pessoa) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(AppRotas.pessoas),
        ),
        centerTitle: true,
        elevation: 20,
        title: Text("Cliente"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Cliente',
            onPressed: () {
              editaPessoa(context, pessoa);
            },
          ),
        ],
      ),
      body: card(pessoa),
    );
  }

  Widget card(PessoaModel pessoa) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 25,
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.person,
                size: 28,
              ),
              title: Text(
                StringUtils.isNotBlank(pessoa.nome) ? pessoa.nome : "",
              ),
            ),
            separador(pessoa.celular),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.celular),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  size: 28,
                ),
                title: Text(StringUtils.isNotBlank(pessoa.celular)
                    ? pessoa.celular
                    : ""),
                onTap: () {
                  launch("tel://${pessoa.celular}");
                },
              ),
            ),
            separador(pessoa.telefone),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.telefone),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  size: 28,
                ),
                title: Text(StringUtils.isNotBlank(pessoa.telefone)
                    ? pessoa.telefone
                    : ""),
                onTap: () {
                  launch("tel://${pessoa.telefone}");
                },
              ),
            ),
            separador(pessoa.email),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.email),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 28,
                ),
                title: Text(
                    StringUtils.isNotBlank(pessoa.email) ? pessoa.email : ""),
                onTap: () {
                  launch("mailto:${pessoa.email}");
                },
              ),
            ),
            separador(pessoa.cpf),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.cpf),
              child: ListTile(
                leading: Icon(
                  Icons.content_copy,
                  size: 28,
                ),
                title:
                    Text(StringUtils.isNotBlank(pessoa.cpf) ? pessoa.cpf : ""),
              ),
            ),
            separador(pessoa.cep),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.cep),
              child: ListTile(
                leading: Icon(
                  Icons.add_location,
                  size: 28,
                ),
                title:
                    Text(StringUtils.isNotBlank(pessoa.cep) ? pessoa.cep : ""),
              ),
            ),
            separador(pessoa.numero),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.numero),
              child: ListTile(
                leading: Icon(
                  Icons.local_play,
                  size: 28,
                ),
                title: Text(
                    StringUtils.isNotBlank(pessoa.numero) ? pessoa.numero : ""),
              ),
            ),
            separador(pessoa.rua),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.rua),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 28,
                ),
                title:
                    Text(StringUtils.isNotBlank(pessoa.rua) ? pessoa.rua : ""),
              ),
            ),
            separador(pessoa.bairro),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.bairro),
              child: ListTile(
                leading: Icon(
                  Icons.local_activity,
                  size: 28,
                ),
                title: Text(
                    StringUtils.isNotBlank(pessoa.bairro) ? pessoa.bairro : ""),
              ),
            ),
            separador(pessoa.cidade),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.cidade),
              child: ListTile(
                leading: Icon(
                  Icons.location_city,
                  size: 28,
                ),
                title: Text(
                    StringUtils.isNotBlank(pessoa.cidade) ? pessoa.cidade : ""),
              ),
            ),
            separador(pessoa.uf),
            Visibility(
              visible: StringUtils.isNotBlank(pessoa.uf),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 28,
                ),
                title: Text(StringUtils.isNotBlank(pessoa.uf) ? pessoa.uf : ""),
              ),
            ),
            SizedBox(height: 10),
            FlatButton.icon(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                showAlert(context, pessoa.nome, pessoa.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              label: Text(
                "Remover",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
