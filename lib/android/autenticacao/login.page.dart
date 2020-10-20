import 'package:loja/android/autenticacao/trocasenha.page.dart';
import 'package:loja/controllers/usuario.controller.dart';
import 'package:loja/mensagens/msg.utils.dart';
import 'package:loja/rotas/rotas.dart';
import 'package:loja/shared/widgets/app.widgets.dart';
import 'package:loja/shared/widgets/input.form.field.dart';
import 'package:loja/shared/widgets/input.form.field.password.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = UsuarioController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> key = new GlobalKey();
  bool ehFormularioValido = false;
  String email;
  String senha;

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(MsgUtil.login),
        ),
      ),
      key: scaffoldKey,
      body: card(),
    );
  }

  Widget card() {
    return Card(
      elevation: 25,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            fotoLogin(),
            SizedBox(height: 5),
            new Form(
              key: key,
              autovalidate: ehFormularioValido,
              child: Column(
                children: <Widget>[
                  InputFormFied(
                    label: MsgUtil.email,
                    typeInput: TextInputType.emailAddress,
                    ehCampoObrigatorio: true,
                    textCapitalization: TextCapitalization.none,
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
                  new SizedBox(height: 10),
                  recuperaSenha(),
                  SizedBox(height: 5),
                  botaoCustomizado(submit, MsgUtil.entrar),
                  SizedBox(height: 5),
                ],
              ),
            ),
            SizedBox(height: 5),
            cadastrese(),
          ],
        ),
      ),
    );
  }

  submit() {
    if (key.currentState.validate()) {
      key.currentState.save();
      logar();
    } else {
      setState(() {
        ehFormularioValido = false;
      });
    }
  }

  logar() async {
    final controller = UsuarioController();
    controller.logar(email, senha).then((result) async {
      if (result != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("usuarioLogado", true);
        Navigator.of(context).pushReplacementNamed(
          AppRotas.home,
        );
      } else {
        ocorreuErro();
      }
    }).catchError((onError) {
      print(onError);
      ocorreuErro();
    });
  }

  Widget recuperaSenha() {
    return Container(
      height: 35,
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          "Recuperar Senha",
          textAlign: TextAlign.right,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrocaSenhaPage(),
            ),
          );
        },
      ),
    );
  }

  Widget cadastrese() {
    return Container(
      height: 50,
      child: FlatButton(
        child: Text(
          "Cadastre-se",
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRotas.usuario,
          );
        },
      ),
    );
  }

  Widget fotoLogin() {
    return SizedBox(
      width: 80,
      height: 80,
      child: Image.asset("assets/images/caixa.png"),
    );
  }

  usuarioInvalido() {
    final snackBar = SnackBar(
      content: Text(MsgUtil.usuarioSenhaInvalido),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  ocorreuErro() {
    final snackBar = SnackBar(
      content: Text(MsgUtil.ocorreuErro),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
