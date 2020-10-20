//import 'package:flutter/widgets.dart' show FormFieldValidator;
import 'package:flutter/widgets.dart';

class ValidadorUtil {
  static bool ehObrigatorio(String value, {bool campoPodeSerNull = true}) {
    if (value == null || value.isEmpty) {
      return false;
    } else {
      if (!campoPodeSerNull) {
        if (RegExp(r"\s").hasMatch(value)) {
          return false;
        }
      }
      return true;
    }
  }

  static bool isEqualTo(dynamic value, dynamic valueToCompare) {
    if (value == valueToCompare)
      return true;
    else
      return false;
  }

  static isNumber(String value, {bool allowSymbols = true}) {
    if (value == null) return false;

    var numericRegEx = RegExp(r"^[+-]?([0-9]*[.])?[0-9]+$");
    var numericNoSymbolsRegExp = RegExp(r"^[0-9]+$");

    if (allowSymbols) {
      return numericRegEx.hasMatch(value);
    } else
      return numericNoSymbolsRegExp.hasMatch(value);
  }

  static bool minLength(String value, int minLength) {
    if (value.isEmpty) return false;
    if (value.length >= minLength)
      return true;
    else
      return false;
  }

  static bool maxLength(String value, int maxLength) {
    if (value.isEmpty) return false;
    if (value.length <= maxLength)
      return true;
    else
      return false;
  }

  static bool maxValue(double value, double maxValue) {
    if (value < maxValue) return true;
    return false;
  }

  static bool minValue(double value, double minValue) {
    if (value > minValue) return true;
    return false;
  }

  static bool isUppercase(String value) {
    if (value == null) return false;
    return value.compareTo(value.toUpperCase()) == 0;
  }

  static bool isLowercase(String value) {
    if (value == null) return false;
    return value.compareTo(value.toLowerCase()) == 0;
  }

  static bool isAlphaNumeric(String value) {
    if (value == null) return false;
    var alphaNumRegExp = RegExp(r"^[0-9A-Z]+$", caseSensitive: false);
    return alphaNumRegExp.hasMatch(value);
  }

  static bool isAlpha(String value) {
    if (value == null) return false;
    var alphaRegExp = RegExp(r"^[A-Z]+$", caseSensitive: false);
    return alphaRegExp.hasMatch(value);
  }
}

class FieldValidator {
  /// You can override the error message
  static FormFieldValidator<String> required({String message}) {
    return (fieldValue) {
      if (ValidadorUtil.ehObrigatorio(fieldValue)) {
        return null;
      } else {
        return message ?? "Campo é obrigatório";
      }
    };
  }

  static FormFieldValidator<String> equalTo(dynamic value, {String message}) {
    return (fieldValue) {
      var valueToCompare;
      if (value is TextEditingController) {
        valueToCompare = value.text;
      } else {
        valueToCompare = value;
      }
      if (ValidadorUtil.isEqualTo(fieldValue, valueToCompare)) {
        return null;
      } else {
        return message ?? "Os valores não correspondem";
      }
    };
  }

  static FormFieldValidator<String> number(
      {bool noSymbols = true, String message}) {
    return (fieldValue) {
      if (ValidadorUtil.isNumber(fieldValue, allowSymbols: noSymbols)) {
        return null;
      } else {
        return message ?? "O campo deve conter apenas números";
      }
    };
  }

  static FormFieldValidator<String> letraNumero({String message}) {
    return (fieldValue) {
      if (ValidadorUtil.isAlphaNumeric(fieldValue)) {
        return null;
      } else {
        return message ?? "O campo deve conter letras e números";
      }
    };
  }

  static FormFieldValidator<String> minLength(int minLength, {String message}) {
    return (fieldValue) {
      if (ValidadorUtil.minLength(fieldValue, minLength)) {
        return null;
      } else {
        return message ?? "Tamanho mínimo permitido $minLength";
      }
    };
  }

  static FormFieldValidator<String> maxLength(int maxLength, {String message}) {
    return (fieldValue) {
      if (ValidadorUtil.maxLength(fieldValue, maxLength)) {
        return null;
      } else {
        return message ?? "Tamanho máximo $maxLength";
      }
    };
  }

  static FormFieldValidator<String> maxValue(
      {double maxValue, String message}) {
    return (fieldValue) {
      if (fieldValue.trim().isEmpty)
        return message ?? "O campo deve ser menor que $maxValue";
      double dFieldValue = double.parse(fieldValue
          .replaceAll(" ", "")
          .replaceAll(",", "")
          .replaceAll(".", ""));
      if (ValidadorUtil.maxValue(dFieldValue, maxValue)) {
        return null;
      } else {
        return message ?? "O campo deve ser menor que $maxValue";
      }
    };
  }

  static FormFieldValidator<String> minValue(
      {double minValue, String message}) {
    return (fieldValue) {
      if (fieldValue.trim().isEmpty)
        return message ?? "O campo deve ser maior que $maxValue";
      double dFieldValue = double.parse(fieldValue
          .replaceAll(" ", "")
          .replaceAll(",", "")
          .replaceAll(".", ""));
      if (ValidadorUtil.minValue(dFieldValue, minValue)) {
        return null;
      } else {
        return message ?? "O campo deve ser maior que $maxValue";
      }
    };
  }

  static FormFieldValidator<String> regExp(RegExp pattern,
      [String errorMessage]) {
    return (value) {
      if (value.isEmpty) return null;

      if (pattern.hasMatch(value))
        return null;
      else
        return errorMessage ?? "Não corresponda às regras de padrão exigidas";
    };
  }

  static FormFieldValidator multiple(
      List<FormFieldValidator<String>> validators) {
    return (fieldValue) {
      for (FormFieldValidator validator in validators) {
        var outcome = validator(fieldValue);
        if (outcome != null) return outcome;
      }
      return null;
    };
  }
}
