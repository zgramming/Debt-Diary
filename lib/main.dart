import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'package:network/models/history/history_model_hive.dart';
import 'package:network/models/debt/debt_model_hive.dart';
import 'package:network/models/user/user_model_hive.dart';

import './widgets/initial_screen/materialapp_custom.dart';

import './screens/intro_screen.dart';
import './screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(UserModelHiveAdapter(), 0);
  Hive.registerAdapter(DebtModelHiveAdapter(), 1);
  Hive.registerAdapter(HistoryModelHiveAdapter(), 2);
  await Hive.openBox('user_box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const routeNamed = "/default-page";
  @override
  Widget build(BuildContext context) {
    return WatchBoxBuilder(
      box: Hive.box('user_box'),
      builder: (ctx, box) {
        final UserModelHive userModelHive = box.get("userSession");
        if (box.isEmpty) {
          return MaterialAppCustom(
            home: IntroScreen(),
          );
        } else {
          return MaterialAppCustom(
            brightness:
                userModelHive.darkMode ? Brightness.dark : Brightness.light,
            home: HomeScreen(),
          );
        }
      },
    );
  }
}
