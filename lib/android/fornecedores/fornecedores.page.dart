import 'package:flutter/material.dart';
import 'package:loja/rotas/rotas.dart';

class FornecedoresPage extends StatefulWidget {
  FornecedoresPage({Key key}) : super(key: key);

  @override
  _FornecedoresPageState createState() => _FornecedoresPageState();
}

class _FornecedoresPageState extends State<FornecedoresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fornecedores"),
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
          child: Text("Fornecedores"),
        ),
      ),
    );
  }
}
