import 'package:flutter/material.dart';
import 'package:loja/models/pessoa.model.dart';
import 'package:loja/rotas/rotas.dart';
import 'package:loja/utils/string.utils.dart';

class PessoaItensPage extends StatelessWidget {
  final PessoaModel pessoa;
  PessoaItensPage({@required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return new Card(
      clipBehavior: Clip.antiAlias,
      elevation: 25,
      margin: EdgeInsets.all(7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () => {
          //Navigator.of(context).pushReplacementNamed(AppRotas.pessoadet, arguments: pessoa.id),

          Navigator.of(context)
              .popAndPushNamed(AppRotas.pessoadet, arguments: pessoa.id),
        },
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new ListTile(
              leading: Container(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(pessoa.id.toString()),
              title: new Text(
                StringUtils.isNotBlank(pessoa.nome) ? pessoa.nome : "",
                style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
