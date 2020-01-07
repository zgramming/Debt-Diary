import 'package:flutter/material.dart';

class AlertDialogFingerprintError extends StatelessWidget {
  final String titleError;
  final String subtitleError;
  AlertDialogFingerprintError({this.titleError, this.subtitleError});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(titleError,
          style: textTheme.title.copyWith(fontWeight: FontWeight.bold)),
      content: Text(subtitleError),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('OKE'))
      ],
    );
  }
}
