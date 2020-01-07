import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/detail_debt/header_detail.dart';

class DateDetailContent extends StatelessWidget {
  final TextTheme textTheme;
  final int remainingDay;
  final int remainingHour;
  final DateTime dateBorrow;
  final DateTime dateReturn;
  DateDetailContent(
    this.textTheme,
    this.remainingDay,
    this.remainingHour,
    this.dateBorrow,
    this.dateReturn,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderTextContent(textTheme, "Date Detail"),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            Text("${DateFormat.yMMMd().format(dateBorrow)}")
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          children: <Widget>[
                            Icon(Icons.date_range),
                            Text("${DateFormat.yMMMd().format(dateReturn)}")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        if (remainingDay >= 1)
                          TextSpan(
                            children: [
                              TextSpan(
                                text: remainingDay.toString(),
                                style: textTheme.display3.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(text: "Days"),
                            ],
                          )
                        else if (remainingHour == 0)
                          TextSpan(
                            text: "Time Out",
                            style: textTheme.title.copyWith(color: Colors.red),
                          )
                        else
                          TextSpan(
                            children: [
                              TextSpan(
                                text: remainingHour.toString(),
                                style: textTheme.display3.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(text: "Hours"),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
