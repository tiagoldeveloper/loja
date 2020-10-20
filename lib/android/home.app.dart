import 'package:loja/rotas/rotas.dart';
import 'package:loja/styles/styles.dart';
import 'package:flutter/material.dart';

class AndroidHomeApp extends StatefulWidget {
  @override
  _AndroidHomeAppState createState() => _AndroidHomeAppState();
}

class _AndroidHomeAppState extends State<AndroidHomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja',
      debugShowCheckedModeBanner: false,
      theme: stylesHome(context),
      initialRoute: AppRotas.splash,
      routes: mapaRotas,
    );
  }
}
