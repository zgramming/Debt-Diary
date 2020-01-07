import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertDialogHomeCustom extends StatelessWidget {
  final String titleDialog;
  final TextEditingController controllerDialog;
  final String labelDialog;
  final String buttonText;
  final IconData icon;
  final int amountLack;
  final Function onPressed;
  AlertDialogHomeCustom({
    @required this.titleDialog,
    @required this.controllerDialog,
    @required this.labelDialog,
    @required this.buttonText,
    @required this.icon,
    @required this.amountLack,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final formKeys = GlobalKey<FormState>();
    return Form(
      key: formKeys,
      child: _SystemPadding(
        child: AlertDialog(
          title: Text(titleDialog),
          content: TextFormField(
            controller: controllerDialog,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: labelDialog,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
            validator: (value) {
              if (value.isEmpty) {
                print('error');
                return "Provided Amount";
              } else if (int.tryParse(value) > amountLack) {
                return "Too Much";
              }
              return null;
            },
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(icon),
              label: Text(buttonText),
              color: Theme.of(context).primaryColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: () async {
                final form = formKeys.currentState.validate();
                if (form) {
                  return onPressed();
                } else {
                  print('Error Validate');
                  return null;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({this.child});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    print(mediaQuery.viewInsets.bottom);
    return AnimatedContainer(
      padding: mediaQuery.padding,
      color: Colors.black.withOpacity(.5),
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
