import 'package:loja/utils/string.utils.dart';
import 'package:flutter/material.dart';

class TrocaSenhaPage extends StatefulWidget {
  @override
  _TrocaSenhaPagePageState createState() => _TrocaSenhaPagePageState();
}

class _TrocaSenhaPagePageState extends State<TrocaSenhaPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email;

  @override
  Widget build(BuildContext context) {
    Widget appAbar() {
      return AppBar(
        title: Text('Troca senha'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      );
    }

    Widget boxInformativo() {
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/reset-password-icon.png"),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Esqueceu sua senha?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    _submit() {
      if (_key.currentState.validate()) {
        _key.currentState.save();
      } else {
        setState(() {
          _validate = true;
        });
      }
    }

    Widget botaoEnviar() {
      return Container(
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [
              Colors.blue,
              Colors.blue,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: SizedBox.expand(
          child: FlatButton(
            child: Text(
              "Enviar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              _submit();
            },
          ),
        ),
      );
    }

    //valida email
    String validaEmail(String email) {
      if (StringUtils.isBlank(email)) {
        return "Email é obrigatório.";
      } else if (!StringUtils.ehEmailValido(email)) {
        return "E-mail inválido";
      }
      return null;
    }

    Widget campoEmail() {
      return new TextFormField(
        decoration: new InputDecoration(
          labelText: "E-mail",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        maxLength: 150,
        validator: validaEmail,
        onSaved: (String valor) {
          email = valor;
        },
      );
    }

    Widget criaForm() {
      return new Form(
        key: _key,
        autovalidate: _validate,
        child: campoEmail(),
      );
    }

    Widget formulario() {
      return Container(
        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                boxInformativo(),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      criaForm(),
                      SizedBox(height: 20),
                      botaoEnviar(),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appAbar(),
      body: formulario(),
    );
  }
}
