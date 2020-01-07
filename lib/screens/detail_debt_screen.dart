import 'package:debt_diary/widgets/detail_debt/sliverappbar_detail_debt.dart';
import 'package:debt_diary/widgets/detail_debt/sliverlist_detail_debt.dart';
import 'package:flutter/material.dart';
import 'package:network/models/debt/debt_model_hive.dart';

class DetailDebtScreen extends StatelessWidget {
  static const routeNamed = "/detail-debt";
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final loadedDebt = DebtModelHive.fromJson(arguments);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarDetailDebt(
            id: loadedDebt.id,
            receiverName: loadedDebt.receiverName,
            imageReceiver: loadedDebt.imageReceiver,
          ),
          SliverListDetailDebt(
            receiverName: loadedDebt.receiverName,
            dateBorrow: loadedDebt.dateBorrow,
            dateReturn: loadedDebt.dateReturn,
            amountDebt: loadedDebt.amountDebt,
            amountLack: loadedDebt.amountLack,
            imageSignature: loadedDebt.imageSignature,
          ),
        ],
      ),
    );
  }
}
