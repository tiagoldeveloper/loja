import 'package:flutter/material.dart';
import 'package:loja/controllers/pessoa.controller.dart';
import 'package:loja/rotas/rotas.dart';

class PessoaConPage extends StatelessWidget {
  final PessoaController controller;

  PessoaConPage({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return appBar(context);
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      title: TextField(
        textCapitalization: TextCapitalization.words,
        autofocus: true,
        onChanged: (value) {
          controller.search(value);
        },
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Raleway',
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Raleway',
        ),
      ),
      //iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRotas.pessoa);
            /* 
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PessoaCadastroPage(
                  pessoa: PessoaModel(id: 0),
                ),
              ),
            );
            */
          },
        ),
      ],
    );
  }

  /* 
  AppBar(
      backgroundColor: Colors.transparent,
      elevation: 20,
      title: Observer(
        builder: (_) => controller.showSearch
            ? TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Pesquisar...",
                ),
                onSubmitted: (val) {
                  controller.search(val);
                },
              )
            : Text("Meus Contato"),
      ),
      centerTitle: true,
      leading: FlatButton(
        onPressed: () {
          if (controller.showSearch) controller.search("");
          controller.toggleSearc();
        },
        child: Observer(
          builder: (_) => Icon(
            controller.showSearch ? Icons.close : Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );

    */

}

/*
 Widget appBar(BuildContext context) {
    return AppBar(
      title: TextField(
        autofocus: true,
        decoration: InputDecoration(
            hintText: " Search...",
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )),
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      iconTheme: IconThemeData(color: Color.fromRGBO(9, 133, 46, 100)),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Color.fromRGBO(9, 133, 46, 100),
          ),
          onPressed: () {
            print('klikniete');
          },
        ),
      ],
    );
  }


 */
