import 'package:flutter/material.dart';
import 'package:loja/android/autenticacao/login.page.dart';
import 'package:loja/android/autenticacao/trocasenha.page.dart';
import 'package:loja/android/autenticacao/usuario.page.dart';
import 'package:loja/android/fornecedores/fornecedores.page.dart';
import 'package:loja/android/homepage/home.page.dart';
import 'package:loja/android/homepage/pagina.splash.dart';
import 'package:loja/android/pessoas/pessoa.page.dart';
import 'package:loja/android/pessoas/pessoa.det.page.dart';
import 'package:loja/android/pessoas/pessoa.itens.page.dart';
import 'package:loja/android/pessoas/pessoas.page.dart';
import 'package:loja/android/pessoas/pessoa.loading.page.dart';
import 'package:loja/android/pessoas/pessoa.con.page.dart';
import 'package:loja/android/produtos/produtos.page.dart';
import 'package:loja/controllers/pessoa.controller.dart';
import 'package:loja/models/pessoa.model.dart';

class AppRotas {
  //home
  static const home = '/';
  static const splash = '/splash';

  //autenticação
  static const login = '/login';
  static const usuario = '/usuario';
  static const trocasenha = '/trocarsenha';

  //pessoas
  static const pessoa = '/pessoa';
  static const pessoadet = '/pessoadet';
  static const pessoas = '/pessoas';
  static const pessoasitens = '/pessoasitens';
  static const pessoasloading = '/pessoasloading';
  static const pessoacon = '/pessoacon';

  //outros
  static const fornecedorespage = "/fornecedorespage";
  static const produtospage = "/produtospage";
}

final mapaRotas = <String, WidgetBuilder>{
  //home
  AppRotas.home: (ctx) => HomePage(),
  AppRotas.splash: (ctx) => SplashPage(),

  //usuario
  AppRotas.login: (ctx) => LoginPage(),
  AppRotas.usuario: (ctx) => UsuarioCadastroPage(),
  AppRotas.trocasenha: (ctx) => TrocaSenhaPage(),

  //pessoas
  AppRotas.pessoa: (ctx) => PessoaCadastroPage(pessoa: PessoaModel()),
  AppRotas.pessoadet: (ctx) => PessoaDetalhePage(),
  AppRotas.pessoas: (ctx) => PessoasPage(),
  AppRotas.pessoasitens: (ctx) => PessoaItensPage(pessoa: new PessoaModel()),
  AppRotas.pessoasloading: (ctx) => LoadingPessoaPage(),
  AppRotas.pessoacon: (ctx) => PessoaConPage(controller: PessoaController()),

  //outros
  AppRotas.fornecedorespage: (ctx) => FornecedoresPage(),
  AppRotas.produtospage: (ctx) => ProdutosPage(),
};
