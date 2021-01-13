import 'package:flutter/material.dart';

class AppCustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double radius;

  const AppCustomButton(
      {Key key,
      @required this.color,
      @required this.child,
      this.height,
      this.radius,
      @required this.onPressed,
      @required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        textColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        color: color,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
