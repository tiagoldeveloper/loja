import 'package:loja/models/usuario.model.dart';
import 'package:loja/repositories/usuario.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioController {
  final _usuarioRep = new UsuarioRepository();

  Future grava(Usuario usuario) async {
    _usuarioRep.grava(usuario);
  }

  Future<Usuario> logar(String email, String senha) async {
    return _usuarioRep.logar(email, senha);
  }

  Future<bool> isUsuarioAuthenticado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("usuarioLogado") != null
        ? prefs.get("usuarioLogado")
        : false;
  }

  Future<void> invalidaUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("usuarioLogado", false);
  }
}
