import 'package:flutter/material.dart';

class HistoryHeaderDate extends StatelessWidget {
  final String dateHistoryCreate;
  final Color headerColor;
  final Color textColor;
  HistoryHeaderDate(this.dateHistoryCreate, this.headerColor, this.textColor);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: headerColor),
      child: Text(
        dateHistoryCreate,
        style: textTheme.subhead
            .copyWith(fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}
