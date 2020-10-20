import 'package:flutter/material.dart';
import 'package:loja/rotas/rotas.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRotas.home,
                );
              },
            );
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Produtos"),
        ),
      ),
    );
  }
}
