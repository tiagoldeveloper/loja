import 'package:flutter/material.dart';
import 'package:loja/utils/validador.utils.dart';

String validaCampo(String valor, String nomeCampo, TextInputType inputType,
    int tamanho, bool ehCampoObrigatorio) {
  if (ehCampoObrigatorio) {
    if (StringUtils.isBlank(valor)) {
      return nomeCampo + " é obrigatório.";
    }

    if (TextInputType.emailAddress == inputType &&
        StringUtils.ehEmailValido(valor)) {
      return "E-mail inválido";
    }

    if ((inputType != TextInputType.emailAddress) &&
        tamanho > 0 &&
        !ValidadorUtil.minLength(valor, tamanho)) {
      return nomeCampo +
          " deve ser maior que " +
          tamanho.toString() +
          " caracteres.";
    }
  }

  return null;
}

class StringUtils {
  // ignore: unused_field
  static const String _patttern = r'(^[a-zA-Z ]*$)';

  static const String _pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String defaultString(String str, {String defaultStr = ''}) {
    return str ?? defaultStr;
  }

  static bool isBlank(String s) => (s == null || s.isEmpty) ? true : false;
  static bool isNotBlank(String s) => !isBlank(s);

  static bool equalsIgnoreCase(String a, String b) =>
      (a == null && b == null) ||
      (a != null && b != null && a.toLowerCase() == b.toLowerCase());

  static bool ehEmailValido(String email) {
    RegExp regExp = new RegExp(_pattern);
    if (StringUtils.isBlank(email)) {
      return false;
    } else if (!regExp.hasMatch(email)) {
      return true;
    }
    return false;
  }
}
