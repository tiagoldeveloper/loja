import 'package:flutter/material.dart';

Widget botaoCustomizado(Function onSubmit, String label) {
  return Container(
    height: 50,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3, 1],
        colors: [
          Colors.blue,
          Colors.blue,
        ],
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: SizedBox.expand(
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onPressed: () {
          onSubmit();
        },
      ),
    ),
  );
}

class MyTextField extends StatefulWidget {
  final Key key;
  final String initialValue;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final bool autovalidate;
  final bool maxLengthEnforced;
  final int maxLines;
  final int maxLength;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool enabled;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final ValueChanged<String> onChanged;

  MyTextField(
      {this.key,
      this.initialValue,
      this.focusNode,
      this.decoration = const InputDecoration(),
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.style,
      this.textAlign = TextAlign.start,
      this.autofocus = false,
      this.obscureText = false,
      this.autocorrect = true,
      this.autovalidate = false,
      this.maxLengthEnforced = true,
      this.maxLines = 1,
      this.maxLength,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.enabled,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.onChanged});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController _controller = new TextEditingController();

  _onChangedValue() {
    if (widget.onChanged != null) {
      widget.onChanged(_controller.text);
    }
  }

  @override
  void initState() {
    _controller.addListener(_onChangedValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onChangedValue);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      controller: _controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style,
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      autovalidate: widget.autovalidate,
      maxLengthEnforced: widget.maxLengthEnforced,
      maxLines: widget.maxLines,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      enabled: widget.enabled,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
    );
  }
}
