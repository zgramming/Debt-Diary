import 'package:flutter/material.dart';

class NameActionCustom extends StatelessWidget {
  final String actionName;
  final double radius;
  NameActionCustom({this.actionName, this.radius = 30});
  @override
  Widget build(BuildContext context) {
    if (actionName == "add") {
      return CircleAvatar(
        backgroundColor: Colors.green,
        radius: radius,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/icon-add.png", color: Colors.white),
        ),
      );
    } else if (actionName == "delete") {
      return CircleAvatar(
        backgroundColor: Colors.red,
        radius: radius,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Image.asset("assets/images/icon-delete.png", color: Colors.white),
        ),
      );
    } else if (actionName == "substract") {
      return CircleAvatar(
        backgroundColor: Colors.blue,
        radius: radius,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Image.asset("assets/images/icon-reduce.png", color: Colors.white),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundImage: AssetImage("assets/images/icon-question.png"),
        backgroundColor: Colors.transparent,
      );
    }
  }
}
