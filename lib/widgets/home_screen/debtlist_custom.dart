import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:repository/repository/repository.dart';

import 'package:network/models/debt/debt_model_hive.dart';
import 'package:network/models/history/history_model_hive.dart';

import '../../screens/detail_debt_screen.dart';

import '../../widgets/home_screen/alertdialog_custom.dart';

class DebtListCustom extends StatelessWidget {
  final DateTime id;
  final String receiverName;
  final int amountDebt;
  final int amountLack;
  final DateTime dateReturn;
  final DateTime dateBorrow;
  final String imageReceiver;
  final Uint8List imageSignature;
  final Box box;
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;
  DebtListCustom({
    this.id,
    this.receiverName,
    this.amountDebt,
    this.amountLack,
    this.dateReturn,
    this.dateBorrow,
    this.imageReceiver,
    this.imageSignature,
    this.box,
    this.index,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountSubstractController =
        TextEditingController();
    final textTheme = Theme.of(context).textTheme;
    final Repository repository = Repository();
    final remainingDayDate = dateReturn.difference(DateTime.now()).inDays;
    final remainingHoursDate = dateReturn.difference(DateTime.now()).inHours;
    final formatCurrency = NumberFormat.simpleCurrency(name: "Rp.");

    return Dismissible(
      key: UniqueKey(),
      crossAxisEndOffset: .5,
      background: SwipeCustom(),
      onDismissed: (direction) async {
        return await repository
            .addHistory(
              historyModelhives: HistoryModelHive()
                ..id = DateTime.now()
                ..receiverName = receiverName
                ..amountDebt = amountDebt
                ..amountLack = amountLack
                ..amountSubstract = 0
                ..dateHistoryCreate = DateTime.now()
                ..imageReceiver = imageReceiver
                ..imageSignature = imageSignature
                ..actionName = "delete",
            )
            .then(
              (_) => repository.deleteDebt(
                boxName: box,
                index: index,
                scaffoldKey: scaffoldKey,
                snackBar: SnackBar(
                  content: Text('Deleted $receiverName'),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () => repository.undoDebt(
                      boxName: box,
                      index: index,
                      debtModelHive: DebtModelHive()
                        ..id = id
                        ..receiverName = receiverName
                        ..amountDebt = amountDebt
                        ..amountLack = amountLack
                        ..dateReturn = dateReturn
                        ..dateBorrow = dateBorrow
                        ..imageReceiver = imageReceiver
                        ..imageSignature = imageSignature,
                    ),
                  ),
                ),
              ),
            );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          onLongPress: () => showDialog(
            context: context,
            builder: (ctxDialog) => AlertDialogHomeCustom(
              titleDialog: "Total  : ${formatCurrency.format(amountLack)}",
              controllerDialog: _amountSubstractController,
              labelDialog: "Substract",
              buttonText: "Substract it",
              icon: Icons.save,
              amountLack: amountLack,
              onPressed: () async {
                repository
                    .substractDebt(
                      context: ctxDialog,
                      boxName: box,
                      index: index,
                      debtModelHive: DebtModelHive()
                        ..id = id
                        ..receiverName = receiverName
                        ..amountDebt = amountDebt
                        ..amountLack = amountLack -
                            int.tryParse(_amountSubstractController.text)
                        ..dateReturn = dateReturn
                        ..dateBorrow = dateBorrow
                        ..imageReceiver = imageReceiver
                        ..imageSignature = imageSignature,
                    )
                    .then(
                      (_) => repository.addHistory(
                        historyModelhives: HistoryModelHive()
                          ..id = DateTime.now()
                          ..receiverName = receiverName
                          ..amountDebt = amountDebt
                          ..amountLack = amountLack -
                              int.tryParse(_amountSubstractController.text)
                          ..amountSubstract =
                              int.tryParse(_amountSubstractController.text)
                          ..dateHistoryCreate = DateTime.now()
                          ..imageReceiver = imageReceiver
                          ..imageSignature = imageSignature
                          ..actionName = "substract",
                      ),
                    );
              },
            ),
          ),
          onTap: () => Navigator.of(context)
              .pushNamed(DetailDebtScreen.routeNamed, arguments: {
            "id": id,
            "receiverName": receiverName,
            "amountDebt": amountDebt,
            "amountLack": amountLack,
            "dateReturn": dateReturn,
            "dateBorrow": dateBorrow,
            "imageReceiver": imageReceiver,
            "imageSignature": imageSignature,
          }),
          contentPadding: const EdgeInsets.all(24),
          leading: Hero(
            tag: id,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: FileImage(File(imageReceiver)),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              receiverName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textTheme.title.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: amountLack <= 0
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text('PAID OFF',
                      style: textTheme.subhead.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                )
              : Text("${formatCurrency.format(amountLack)}"),
          trailing: CircleAvatar(
            backgroundColor:
                remainingHoursDate <= 12 ? Colors.red : Colors.blue,
            radius: 30,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text.rich(
                  (remainingDayDate >= 1)
                      ? TextSpan(children: [
                          TextSpan(
                            text: remainingDayDate.toString(),
                            style: textTheme.display3.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: "Day",
                              style: textTheme.subtitle
                                  .copyWith(color: Colors.white))
                        ])
                      : (remainingHoursDate == 0)
                          ? TextSpan(
                              text: "Time Out",
                              style: textTheme.display3.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                          : TextSpan(children: [
                              TextSpan(
                                  text: remainingHoursDate.toString(),
                                  style: textTheme.display3.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Hours",
                                  style: textTheme.subtitle
                                      .copyWith(color: Colors.white))
                            ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SwipeCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.delete, color: Colors.white),
          Icon(Icons.delete, color: Colors.white),
        ],
      ),
    );
  }
}
