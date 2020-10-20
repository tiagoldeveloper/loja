import 'package:flutter/material.dart';
import 'package:loja/models/pessoa.model.dart';
import 'package:loja/repositories/pessoa.repository.dart';
import 'package:loja/rotas/rotas.dart';
import 'package:loja/shared/widgets/input.form.field.dart';
import 'package:loja/utils/input.formatter.dart';
import 'package:loja/utils/string.utils.dart';

class PessoaCadastroPage extends StatefulWidget {
  final PessoaModel pessoa;
  PessoaCadastroPage({this.pessoa});

  @override
  _PessoaCadastroState createState() => _PessoaCadastroState();
}

class _PessoaCadastroState extends State<PessoaCadastroPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repository = PessoaRepository();

  TipoPessoa _tipoPessoa;

  @override
  void initState() {
    super.initState();
    _tipoPessoa = widget.pessoa != null &&
            widget.pessoa.tipoPessoa != null &&
            widget.pessoa.tipoPessoa == 2
        ? TipoPessoa.juridica
        : TipoPessoa.fisica;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(AppRotas.pessoas),
        ),
        centerTitle: true,
        elevation: 10,
        title: Text(StringUtils.isNotBlank(widget.pessoa.nome)
            ? "Cliente"
            : "Cadastro"),
        actions: [
          FlatButton.icon(
            color: Theme.of(context).primaryColor,
            onPressed: onSubmit,
            icon: Icon(
              Icons.save,
              color: Theme.of(context).accentColor,
            ),
            label: Text(
              "Salvar",
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Card(
          elevation: 40,
          margin: EdgeInsets.all(7),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Radio(
                        value: TipoPessoa.fisica,
                        groupValue: _tipoPessoa,
                        onChanged: (TipoPessoa value) {
                          setState(() {
                            _tipoPessoa = value;
                          });
                        },
                      ),
                      new Text(
                        'Pessoa fisica',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: TipoPessoa.juridica,
                        groupValue: _tipoPessoa,
                        onChanged: (TipoPessoa value) {
                          setState(() {
                            _tipoPessoa = value;
                          });
                        },
                      ),
                      new Text(
                        'Pessoa juridica',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  InputFormFied(
                    label: "Nome",
                    initialValue: widget.pessoa?.nome,
                    ehCampoObrigatorio: true,
                    onSaved: (value) {
                      widget.pessoa.nome = value;
                    },
                  ),
                  InputFormFied(
                    label: "Celular",
                    formaters: [
                      FormataCampo().formato(TipoFormato.celular),
                    ],
                    typeInput: TextInputType.phone,
                    initialValue: widget.pessoa?.celular,
                    maxLength: 15,
                    minLength: 15,
                    onSaved: (value) {
                      widget.pessoa.celular = value;
                    },
                  ),
                  InputFormFied(
                    label: "Telefone",
                    formaters: [
                      FormataCampo().formato(TipoFormato.telefone),
                    ],
                    initialValue: widget.pessoa?.telefone,
                    typeInput: TextInputType.phone,
                    maxLength: 14,
                    minLength: 14,
                    onSaved: (value) {
                      widget.pessoa.telefone = value;
                    },
                  ),
                  InputFormFied(
                    label: "E-mail",
                    typeInput: TextInputType.emailAddress,
                    initialValue: widget.pessoa?.email,
                    textCapitalization: TextCapitalization.none,
                    onSaved: (value) {
                      widget.pessoa.email = value;
                    },
                  ),
                  InputFormFied(
                    label: "CPF",
                    formaters: [
                      FormataCampo().formato(TipoFormato.cpf),
                    ],
                    initialValue: widget.pessoa?.cpf,
                    maxLength: 14,
                    minLength: 14,
                    typeInput: TextInputType.number,
                    onSaved: (value) {
                      widget.pessoa.cpf = value;
                    },
                  ),
                  InputFormFied(
                    label: "Cep",
                    initialValue: widget.pessoa?.cpf,
                    formaters: [
                      FormataCampo().formato(TipoFormato.cep),
                    ],
                    typeInput: TextInputType.number,
                    onSaved: (value) {
                      widget.pessoa.cep = value;
                    },
                  ),
                  InputFormFied(
                    label: "Numero",
                    initialValue: widget.pessoa?.numero,
                    onSaved: (value) {
                      widget.pessoa.numero = value;
                    },
                  ),
                  InputFormFied(
                    label: "Endereço",
                    initialValue: widget.pessoa?.rua,
                    onSaved: (value) {
                      widget.pessoa.rua = value;
                    },
                  ),
                  InputFormFied(
                    label: "Bairro",
                    initialValue: widget.pessoa?.bairro,
                    onSaved: (value) {
                      widget.pessoa.bairro = value;
                    },
                  ),
                  InputFormFied(
                    label: "Cidade",
                    initialValue: widget.pessoa?.cidade,
                    onSaved: (value) {
                      widget.pessoa.cidade = value;
                    },
                  ),
                  InputFormFied(
                    label: "UF",
                    initialValue: widget.pessoa?.uf,
                    textCapitalization: TextCapitalization.sentences,
                    onSaved: (value) {
                      widget.pessoa.uf = value;
                    },
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton.icon(
                      color: Colors.blue,
                      onPressed: onSubmit,
                      icon: Icon(
                        Icons.save,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        "Salvar",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  grava() {
    widget.pessoa.id = null;
    widget.pessoa.tipoPessoa = _tipoPessoa == TipoPessoa.fisica ? 1 : 2;
    _repository.grava(widget.pessoa).then((_) {
      Navigator.of(context).pushReplacementNamed(AppRotas.pessoas);
    }).catchError((_) {
      onError();
    });
  }

  update() {
    widget.pessoa.tipoPessoa = (_tipoPessoa == TipoPessoa.fisica) ? 1 : 2;
    _repository.grava(widget.pessoa).then((_) {
      Navigator.of(context).pushReplacementNamed(AppRotas.pessoas);
    }).catchError((_) {
      onError();
    });
  }

  onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (widget.pessoa.id == 0 || widget.pessoa.id == null) {
      grava();
    } else {
      update();
    }
  }

  onError() {
    final snackBar = SnackBar(
      content: Text('Ops, algo deu errado!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
