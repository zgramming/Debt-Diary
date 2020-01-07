import 'package:flutter/material.dart';
import 'package:repository/repository/repository.dart';

class BottomAppBarCustom extends StatelessWidget {
  final PageController pageController;
  BottomAppBarCustom({this.pageController});
  final Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BottomAppBarIconCustom(
              onPressed: () => repository.previousPageView(pageController),
              icon: Icons.home),
          BottomAppBarIconCustom(
              onPressed: () => repository.nextPageView(pageController),
              icon: Icons.history),
        ],
      ),
    );
  }
}

class BottomAppBarIconCustom extends StatelessWidget {
  final int flex;
  final double height;
  final IconData icon;
  final Color color;
  final Function onPressed;
  const BottomAppBarIconCustom({
    this.flex = 1,
    this.height = 50,
    this.color = Colors.white,
    this.icon,
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          height: height,
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}
