import 'package:flutter/material.dart';
import 'package:loja/utils/string.utils.dart';

class InputFormFiedPassword extends StatefulWidget {
  final String label;
  final int maxLength;
  final int minLength;
  final FormFieldSetter<String> onSaved;

  InputFormFiedPassword({
    this.label,
    this.maxLength = 80,
    this.minLength = 1,
    this.onSaved,
  });

  @override
  _InputFormFiedPasswordState createState() => _InputFormFiedPasswordState();
}

class _InputFormFiedPasswordState extends State<InputFormFiedPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      decoration: inputDecoration(),
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      maxLength: widget.maxLength,
      validator: (String valor) {
        return validaCampo(
          valor,
          widget.label,
          TextInputType.text,
          widget.minLength,
          true,
        );
      },
      onSaved: widget.onSaved,
    );
  }

  InputDecoration inputDecoration() {
    return new InputDecoration(
      labelText: widget.label,
      labelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      suffixIcon: openClose(),
    );
  }

  Widget openClose() {
    return IconButton(
      icon: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
    );
  }
}
