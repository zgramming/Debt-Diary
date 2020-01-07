import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:network/models/history/history_model_hive.dart';
import './history_detail_header.dart';

class HistoryDetailBodyCustom extends StatelessWidget {
  final HistoryModelHive model;
  final TextTheme textTheme;
  HistoryDetailBodyCustom({@required this.model, @required this.textTheme});
  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(name: "Rp.");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            HeaderHistoryDetail("Receiver Detail", textTheme),
            SizedBox(height: 10),
            Text(
              model.receiverName,
              style: textTheme.display1.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.8),
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1.5),
            SizedBox(height: 10),
            Visibility(
              visible: model.amountSubstract > 0 ? true : false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderHistoryDetail("Amount Detail", textTheme),
                  SizedBox(height: 10),
                  Text("Amount Substract", style: textTheme.title),
                  SizedBox(height: 10),
                  Text(
                    "-${formatCurrency.format(model.amountSubstract)}",
                    style:
                        textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Amount Lack", style: textTheme.title),
                  SizedBox(height: 10),
                  (model.amountLack <= 0)
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text('PAID OFF',
                              style: textTheme.subhead.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )
                      : Text(
                          "${formatCurrency.format(model.amountLack)}",
                          style: textTheme.subhead
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                  SizedBox(height: 10),
                  Divider(thickness: 1.5),
                ],
              ),
            ),
            HeaderHistoryDetail("Signature Detail", textTheme),
            SizedBox(height: 10),
            Image.memory(
              model.imageSignature,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
