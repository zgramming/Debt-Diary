import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../../widgets/detail_debt/amount_detail_content.dart';
import '../../widgets/detail_debt/date_detail_content.dart';
import '../../widgets/detail_debt/receiver_detail_content.dart';
import '../../widgets/detail_debt/signature_detail_content.dart';

class SliverListDetailDebt extends StatelessWidget {
  final String receiverName;
  final DateTime dateReturn;
  final DateTime dateBorrow;
  final int amountDebt;
  final int amountLack;
  final Uint8List imageSignature;
  SliverListDetailDebt({
    this.receiverName,
    this.dateReturn,
    this.dateBorrow,
    this.amountDebt,
    this.amountLack,
    this.imageSignature,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final remainingDayDate = dateReturn.difference(DateTime.now()).inDays;
    final remainingHoursDate = dateReturn.difference(DateTime.now()).inHours;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Divider(thickness: 1),
          ReceiverNameContent(textTheme, receiverName),
          Divider(thickness: 1),
          DateDetailContent(
            textTheme,
            remainingDayDate,
            remainingHoursDate,
            dateBorrow,
            dateReturn,
          ),
          Divider(thickness: 1),
          AmountDetailContent(textTheme, amountDebt, amountLack),
          Divider(thickness: 1),
          SignatureDetailContent(textTheme, imageSignature),
        ],
      ),
    );
  }
}
