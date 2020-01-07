import 'package:debt_diary/widgets/history/history_nameaction_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:network/models/history/history_model_hive.dart';

class HistoryDetailHeaderCustom extends StatelessWidget {
  final HistoryModelHive model;
  final TextTheme textTheme;
  HistoryDetailHeaderCustom({this.model, this.textTheme});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
              flex: 4,
              child:
                  NameActionCustom(actionName: model.actionName, radius: 40)),
          Flexible(
            flex: 8,
            child: Text(
              "${DateFormat.yMMMMEEEEd().format(model.dateHistoryCreate)}",
              style: textTheme.title.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
                wordSpacing: 2,
                height: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderHistoryDetail extends StatelessWidget {
  final String headerTitle;
  final TextTheme textTheme;
  HeaderHistoryDetail(this.headerTitle, this.textTheme);
  @override
  Widget build(BuildContext context) {
    return Text(
      headerTitle,
      style: textTheme.subtitle.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}
