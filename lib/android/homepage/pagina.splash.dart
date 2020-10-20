import 'package:flutter/material.dart';
import 'package:loja/controllers/usuario.controller.dart';
import 'package:loja/repositories/app.repository.dart';
import 'package:loja/rotas/rotas.dart';
import 'package:loja/shared/widgets/loading.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = UsuarioController();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      AppBase().connection();
      controller.isUsuarioAuthenticado().then((result) async {
        if (result) {
          Navigator.of(context).pushReplacementNamed(
            AppRotas.home,
          );
        } else {
          Navigator.of(context).pushReplacementNamed(
            AppRotas.login,
          );
        }
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      inAsyncCall: true,
      dismissible: true,
      color: Theme.of(context).primaryColor,
      opacity: 0.9,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(),
      ),
    );
  }
}
