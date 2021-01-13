import 'package:flutter/material.dart';

typedef Validator = String Function(String);

class AppTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final String prefix;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final Validator validator;
  const AppTextField(
      {Key key,
      @required this.label,
      @required this.hintText,
      @required this.icon,
      @required this.prefix,
      this.textInputType = TextInputType.text,
      @required this.validator,
      @required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          prefix: Text(prefix != null ? prefix : ""),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
