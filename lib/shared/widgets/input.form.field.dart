import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loja/utils/string.utils.dart';

class InputFormFied extends StatefulWidget {
  final String label;
  final int maxLength;
  final TextInputType typeInput;
  final int minLength;
  final FormFieldSetter<String> onSaved;
  final String initialValue;
  final bool ehCampoObrigatorio;
  final List<TextInputFormatter> formaters;
  final TextCapitalization textCapitalization;

  InputFormFied(
      {this.label,
      this.maxLength = 80,
      this.typeInput = TextInputType.text,
      this.minLength = 2,
      this.onSaved,
      this.initialValue = "",
      this.ehCampoObrigatorio = false,
      this.formaters,
      this.textCapitalization = TextCapitalization.words});

  @override
  _InputFormFiedState createState() => _InputFormFiedState();
}

class _InputFormFiedState extends State<InputFormFied> {
  bool obscureText = false;

  TextEditingController _textController;
  bool _ehCampoEmpty;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
    _ehCampoEmpty = _textController.text.isEmpty;

    _textController.addListener(() {
      if (_ehCampoEmpty != _textController.text.isEmpty) {
        setState(() {
          _ehCampoEmpty = _textController.text.isEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: _textController,
      inputFormatters: widget.formaters != null || widget.formaters != null
          ? widget.formaters
          : [],
      decoration: inputDecoration(),
      keyboardType: widget.typeInput,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization,
      validator: (String valor) {
        return validaCampo(
          valor,
          widget.label,
          widget.typeInput,
          widget.minLength,
          widget.ehCampoObrigatorio,
        );
      },
      onSaved: widget.onSaved,
    );
  }

  InputDecoration inputDecoration() {
    return new InputDecoration(
      labelText: widget.label,
      suffixIcon: _textController.text.isNotEmpty
          ? Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0),
              child: IconButton(
                iconSize: 16.0,
                icon: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _textController.clear();
                  });
                },
              ),
            )
          : null,
      labelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
    );
  }
}
