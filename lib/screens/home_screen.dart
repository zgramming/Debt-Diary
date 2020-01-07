import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../screens/add_debt_screen.dart';
import '../screens/history_screen.dart';

import '../widgets/home_screen/bottom_appbar_custom.dart';
import '../widgets/home_screen/sliverappbar_custom.dart';
import '../widgets/home_screen/sliverlist_custom.dart';

class HomeScreen extends StatefulWidget {
  static const routeNamed = "/home-screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  Future _openBox;
  @override
  void initState() {
    _openBox = Future.wait([
      Hive.openBox("debt_box"),
      Hive.openBox('history_box'),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _openBox,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return SafeArea(
              child: Scaffold(
                key: _scaffoldkey,
                body: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                  children: <Widget>[
                    CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBarCustom(),
                        SliverListCustom(_scaffoldkey),
                      ],
                    ),
                    HistoryScreen(),
                  ],
                ),
                bottomNavigationBar:
                    BottomAppBarCustom(pageController: pageController),
                floatingActionButton: FloatingActionButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AddDebtScreen.routeNamed),
                  child: Icon(Icons.add),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              ),
            );
          }
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
