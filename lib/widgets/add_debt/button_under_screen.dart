import 'package:flutter/material.dart';

class ButtonUnderScreen extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  ButtonUnderScreen({
    this.text = "Save it",
    this.icon = Icons.add,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        color: Theme.of(context).primaryColor,
        textTheme: ButtonTextTheme.primary,
        splashColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
