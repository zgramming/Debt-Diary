import 'package:flutter/material.dart';
import 'package:network/models/user/user_model_hive.dart';
import 'package:repository/repository/repository.dart';

class CustomAlertDialog extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String labelText;
  final String errorTextEmpty;
  final String routeName;
  CustomAlertDialog({
    this.controller,
    this.title,
    this.labelText,
    this.errorTextEmpty,
    this.routeName,
  });
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final Repository _repository = Repository();
  final formKeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeys,
      child: AlertDialog(
        title: Text(widget.title),
        content: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return widget.errorTextEmpty;
            }
            return null;
          },
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.verified_user),
            label: const Text("Let's go"),
            color: Theme.of(context).primaryColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () async {
              final form = formKeys.currentState.validate();
              if (form) {
                print(widget.controller.text);
                await _repository
                    .addUserSession(
                        userModelHive: UserModelHive()
                          ..id = DateTime.now()
                          ..giverName = widget.controller.text
                          ..darkMode = false,
                        routeName: widget.routeName)
                    //TODO Jika Berpindah Halaman Menggunakan ShowDialog , Harus Di pop dahulu kemudian baru pindah kehalaman yang dituju
                    .then((_) => Navigator.of(context)
                        .popUntil((route) => route.isFirst))
                    .then((_) => Navigator.of(context)
                        .pushReplacementNamed(widget.routeName));
              } else {
                print('Failed Validate');
                return;
              }
            },
          )
        ],
      ),
    );
  }
}
