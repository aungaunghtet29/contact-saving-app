import 'dart:io';

import 'package:contant_creat/widgets/platform-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlaformAlertWidget extends BasedPlatFormWidget {
  final String title;
  final String content;
  final String defaultAction;
  final String cancelAction;

  PlaformAlertWidget(
      {@required this.title,
      @required this.content,
      @required this.defaultAction,
      this.cancelAction});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  Future<bool> show(context) {
    return Platform.isIOS
        ? showCupertinoDialog(context: context, builder: (c) => this)
        : showDialog(context: context, builder: (c) => this);
  }

  List<Widget> _buildActions(context) {
    final actions = <Widget>[];
    if (cancelAction != null) {
      actions.add(PlatformDialogAction(
        label: cancelAction,
        isCancel: true,
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ));
    }

    if (defaultAction != null) {
      actions.add(PlatformDialogAction(
        label: defaultAction,
        isCancel: false,
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ));
    }
    return actions;
  }
}

class PlatformDialogAction extends BasedPlatFormWidget {
  final bool isCancel;
  final String label;
  final VoidCallback onPressed;

  PlatformDialogAction(
      {@required this.isCancel, @required this.label, this.onPressed});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      isDefaultAction: isCancel,
      child: Text(label),
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: Text(
        label,
        style: TextStyle(color: isCancel ? Colors.red : null),
      ),
      onPressed: onPressed,
    );
  }
}
