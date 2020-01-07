import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:network/models/user/user_model_hive.dart';
import 'package:repository/repository/repository.dart';

class SliverAppBarCustom extends StatefulWidget {
  @override
  _SliverAppBarCustomState createState() => _SliverAppBarCustomState();
}

class _SliverAppBarCustomState extends State<SliverAppBarCustom> {
  final Box debtBox = Hive.box("debt_box");
  final Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var textTheme = Theme.of(context).textTheme;
    return WatchBoxBuilder(
      box: Hive.box("user_box"),
      builder: (ctx, box) {
        final UserModelHive model = box.get("userSession");
        return SliverAppBar(
          title: Text(model.giverName),
          pinned: true,
          expandedHeight: mediaQuery.size.height / 3,
          actions: <Widget>[
            Switch(
              value: model.darkMode,
              onChanged: (val) {
                repository.changeThemeApp(
                  userModelHive: UserModelHive()
                    ..id = model.id
                    ..giverName = model.giverName
                    ..darkMode = val,
                );
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Trx',
                      style: textTheme.display1.copyWith(color: Colors.white),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: WatchBoxBuilder(
                      box: debtBox,
                      builder: (ctx, box) {
                        if (box.isEmpty) {
                          return Text(
                            "Empty",
                            style: textTheme.display1
                                .copyWith(color: Colors.white),
                          );
                        } else {
                          return Text(
                            box.length.toString(),
                            style: textTheme.display4
                                .copyWith(color: Colors.white),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
