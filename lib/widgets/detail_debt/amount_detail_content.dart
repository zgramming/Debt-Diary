import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/detail_debt/header_detail.dart';

class AmountDetailContent extends StatelessWidget {
  final TextTheme textTheme;
  final int amountDebt;
  final int amountLack;
  AmountDetailContent(this.textTheme, this.amountDebt, this.amountLack);
  final formatCurrency = NumberFormat.simpleCurrency(name: "Rp.");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderTextContent(textTheme, "Amount Debt"),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              "${formatCurrency.format(amountDebt)}",
              style: textTheme.display2.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          HeaderTextContent(textTheme, "Amount Lack"),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: amountLack <= 0
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
                : Text(
                    "${formatCurrency.format(amountLack)}",
                    style: textTheme.display2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }
}
