import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:network/models/debt/debt_model_hive.dart';
import 'package:repository/repository/repository.dart';

import '../../widgets/home_screen/debtlist_custom.dart';

class SliverListCustom extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  SliverListCustom(this.scaffoldKey);
  final Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        WatchBoxBuilder(
          box: Hive.box("debt_box"),
          builder: (ctx, box) {
            final debtList = box.values.toList().cast<DebtModelHive>();
            if (debtList.isEmpty) {
              return Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  "assets/images/empty.png",
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: debtList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext listContext, int i) {
                  final debtValue = debtList[i];
                  return DebtListCustom(
                    id: debtValue.id,
                    receiverName: debtValue.receiverName,
                    amountDebt: debtValue.amountDebt,
                    amountLack: debtValue.amountLack,
                    dateReturn: debtValue.dateReturn,
                    dateBorrow: debtValue.dateBorrow,
                    imageReceiver: debtValue.imageReceiver,
                    imageSignature: debtValue.imageSignature,
                    box: box,
                    index: i,
                    scaffoldKey: scaffoldKey,
                  );
                },
              );
            }
          },
        )
      ]),
    );
  }
}
