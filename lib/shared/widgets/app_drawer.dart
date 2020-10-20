import 'package:loja/controllers/usuario.controller.dart';
import 'package:loja/rotas/rotas.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/caixa.png',
                  width: double.infinity,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Loja",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Raleway',
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.work,
              color: Colors.white,
            ),
            title: Text(
              'Fornecedores',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRotas.fornecedorespage,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.business_center,
              color: Colors.white,
            ),
            title: Text(
              'Produtos',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRotas.produtospage,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.white,
            ),
            title: Text(
              'Clientes',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRotas.pessoas,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            title: Text(
              'Vendas',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRotas.pessoas,
              );
            },
          ),
          const Divider(
            color: Colors.white,
            height: 10,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: Text(
              'Opções',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.autorenew,
              color: Colors.white,
            ),
            title: Text(
              'Sincronizar',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.business,
              color: Colors.white,
            ),
            title: Text(
              'Dados da Empresa',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            title: Text(
              'Sair',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            onTap: () {
              final controller = UsuarioController();
              controller.invalidaUsuario();
              Navigator.of(context).pushReplacementNamed(
                AppRotas.login,
              );
            },
          ),
        ],
      ),
    );
  }
}
