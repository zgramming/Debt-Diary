import 'package:flutter/material.dart';
import 'package:network/models/history/history_model_hive.dart';

import '../widgets/history_detail/history_detail_body.dart';
import '../widgets/history_detail/history_detail_header.dart';

class HistoryDetailScreen extends StatelessWidget {
  static const routeNamed = "/history-detail";

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final loadedHistory = HistoryModelHive.fromJson(arguments);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double mqHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mqHeight * 0.35),
        child: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            "Debt Diary",
            style: textTheme.headline.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          flexibleSpace: HistoryDetailHeaderCustom(
              model: loadedHistory, textTheme: textTheme),
        ),
      ),
      body: HistoryDetailBodyCustom(model: loadedHistory, textTheme: textTheme),
    );
  }
}
