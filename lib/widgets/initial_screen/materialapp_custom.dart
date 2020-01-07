import 'package:flutter/material.dart';

import '../../main.dart';
import '../../screens/add_debt_screen.dart';
import '../../screens/detail_debt_screen.dart';
import '../../screens/history_detail_screen.dart';
import '../../screens/history_screen.dart';
import '../../screens/home_screen.dart';

class MaterialAppCustom extends StatelessWidget {
  final Brightness brightness;
  final Widget home;
  MaterialAppCustom({this.brightness, @required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Debt Diary",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        brightness: brightness,
      ),
      debugShowCheckedModeBanner: false,
      home: home,
      routes: {
        MyApp.routeNamed: (ctx) => MyApp(),
        HomeScreen.routeNamed: (ctx) => HomeScreen(),
        AddDebtScreen.routeNamed: (ctx) => AddDebtScreen(),
        DetailDebtScreen.routeNamed: (ctx) => DetailDebtScreen(),
        HistoryScreen.routeNamed: (ctx) => HistoryScreen(),
        HistoryDetailScreen.routeNamed: (ctx) => HistoryDetailScreen(),
      },
    );
  }
}
