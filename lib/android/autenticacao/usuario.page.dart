import 'package:flutter/material.dart';
import 'package:loja/mensagens/msg.utils.dart';
import 'package:loja/models/usuario.model.dart';
import 'package:loja/repositories/usuario.repository.dart';
import 'package:loja/rotas/rotas.dart';
import 'package:loja/shared/widgets/app.widgets.dart';
import 'package:loja/shared/widgets/input.form.field.dart';
import 'package:loja/shared/widgets/input.form.field.password.dart';

class UsuarioCadastroPage extends StatefulWidget {
  @override
  _UsuarioCadastroPageState createState() => _UsuarioCadastroPageState();
}

class _UsuarioCadastroPageState extends State<UsuarioCadastroPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _form = new GlobalKey<FormState>();
  final repository = new UsuarioRepository();
  String nome;
  String email;
  String senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Cadastro'),
      ),
      body: Container(
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 25,
          margin: EdgeInsets.all(7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  InputFormFied(
                    label: MsgUtil.nome,
                    typeInput: TextInputType.text,
                    ehCampoObrigatorio: true,
                    onSaved: (value) {
                      nome = value;
                    },
                  ),
                  InputFormFied(
                    label: MsgUtil.email,
                    typeInput: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    ehCampoObrigatorio: true,
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  InputFormFiedPassword(
                    label: MsgUtil.senha,
                    onSaved: (value) {
                      senha = value;
                    },
                  ),
                  SizedBox(height: 20),
                  botaoCustomizado(onSubmit, MsgUtil.salvar),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() {
    if (!_form.currentState.validate()) return false;

    _form.currentState.save();

    //grava usuário
    Usuario usuario = new Usuario();
    usuario.nome = nome;
    usuario.email = email;
    usuario.senha = senha;
    repository.grava(usuario).then((_) {
      Navigator.of(context).pushReplacementNamed(
        AppRotas.login,
      );
    }).catchError((_) {
      final snackBar = SnackBar(
        content: Text('Ops, algo deu errado!'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }
}
