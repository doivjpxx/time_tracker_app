import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String defaultActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(defaultActionText),
                ),
              ],
            ));
  }
  return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              CupertinoButton(
                child: Text(defaultActionText),
                onPressed: () => Navigator.of(context).pop(true),
              )
            ],
          ));
}
