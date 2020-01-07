import 'dart:io';
import 'dart:typed_data';

import 'package:debt_diary/screens/history_detail_screen.dart';
import 'package:flutter/material.dart';
import './history_nameaction_custom.dart';

class HistoryListCustom extends StatelessWidget {
  final DateTime id;
  final String receiverName;
  final int amountDebt;
  final int amountLack;
  final int amountSubstract;
  final DateTime dateHistoryCreate;
  final String imageReceiver;
  final Uint8List imageSignature;
  final String actionName;
  HistoryListCustom({
    @required this.id,
    @required this.receiverName,
    @required this.amountDebt,
    @required this.amountLack,
    @required this.amountSubstract,
    @required this.dateHistoryCreate,
    @required this.imageReceiver,
    @required this.imageSignature,
    @required this.actionName,
  });
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        onTap: () => Navigator.of(context)
            .pushNamed(HistoryDetailScreen.routeNamed, arguments: {
          "id": id,
          "receiverName": receiverName,
          "amountDebt": amountDebt,
          "amountLack": amountLack,
          "amountSubstract": amountSubstract,
          "dateHistoryCreate": dateHistoryCreate,
          "imageReceiver": imageReceiver,
          "imageSignature": imageSignature,
          "actionName": actionName,
        }),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundImage: FileImage(File(imageReceiver)),
          radius: 30,
        ),
        title: Text(
          receiverName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: textTheme.title.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: NameActionCustom(
          actionName: actionName,
          radius: 20,
        ),
      ),
    );
  }
}
