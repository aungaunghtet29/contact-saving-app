import 'package:flutter/material.dart';
import 'app-custom-button.dart';

class FormButton extends AppCustomButton {
  FormButton({
    @required String label,
    @required VoidCallback onPressed,
  }) : super(
            color: Colors.teal,
            child: Text(label),
            textColor: Colors.white,
            onPressed: onPressed,
            height: 40.0);
}
