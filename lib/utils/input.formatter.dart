import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum TipoFormato { telefone, celular, cpf, cep }

class _TipoFormato {
  static const String maskCelular = "(##) #####-####";
  static const String maskTelefone = "(##) ####-####";
  static const String maskCpf = "###.###.###-##";
  static const String maskCep = "##.###-###";
}

class FormataCampo {
  MaskTextInputFormatter formato(TipoFormato tipoFormato) {
    Map<String, RegExp> filter = {"#": RegExp(r'[0-9]')};

    switch (tipoFormato) {
      case TipoFormato.celular:
        return new MaskTextInputFormatter(
            mask: _TipoFormato.maskCelular, filter: filter);
      case TipoFormato.telefone:
        return new MaskTextInputFormatter(
            mask: _TipoFormato.maskTelefone, filter: filter);
        break;
      case TipoFormato.cpf:
        return new MaskTextInputFormatter(
            mask: _TipoFormato.maskCpf, filter: filter);
        break;
      case TipoFormato.cep:
        return new MaskTextInputFormatter(
            mask: _TipoFormato.maskCep, filter: filter);
        break;
      default:
        return new MaskTextInputFormatter(
            mask: _TipoFormato.maskCep, filter: filter);
    }
  }
}
