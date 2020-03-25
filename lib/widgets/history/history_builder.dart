import 'package:flutter/material.dart';
import 'package:grouped_listview/grouped_listview.dart';
import 'package:intl/intl.dart';
import 'package:network/models/history/history_model_hive.dart';
import './history_header_date.dart';
import './history_list_custom.dart';

class HistoryBuilder extends StatelessWidget {
  final List<HistoryModelHive> historyList;
  HistoryBuilder({@required this.historyList});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: AppBar(
            centerTitle: true,
            title: Text('Your History'),
          ),
        ),
        Flexible(
          flex: 11,
          child: GroupedListView(
            collection: historyList,
            groupBy: (HistoryModelHive model) =>
                DateFormat.yMd().format(model.dateHistoryCreate),
            listBuilder: (BuildContext context, HistoryModelHive model) =>
                HistoryListCustom(
              id: model.id,
              receiverName: model.receiverName,
              amountDebt: model.amountDebt,
              amountLack: model.amountLack,
              amountSubstract: model.amountSubstract,
              dateHistoryCreate: model.dateHistoryCreate,
              imageReceiver: model.imageReceiver,
              imageSignature: model.imageSignature,
              actionName: model.actionName,
            ),
            groupBuilder: (BuildContext context, String dateHistoryCreate) =>
                HistoryHeaderDate(
              dateHistoryCreate,
              Colors.blue,
              Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
