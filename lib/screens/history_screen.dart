import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/history/history_builder.dart';

import 'package:network/models/history/history_model_hive.dart';

class HistoryScreen extends StatefulWidget {
  static const routeNamed = "/history";

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WatchBoxBuilder(
      box: Hive.box("history_box"),
      builder: (ctx, box) {
        final historyList = box.values.toList().cast<HistoryModelHive>();
        historyList.sort((first, end) =>
            end.dateHistoryCreate.compareTo(first.dateHistoryCreate));
        if (historyList.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            height: double.infinity,
            child: Image.asset("assets/images/empty2.png", fit: BoxFit.cover),
          );
        } else {
          return HistoryBuilder(historyList: historyList);
        }
      },
    );
  }
}
