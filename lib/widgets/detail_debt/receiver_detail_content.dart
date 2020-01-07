import 'package:flutter/material.dart';

class ReceiverNameContent extends StatelessWidget {
  final TextTheme textTheme;
  final String receiverName;
  ReceiverNameContent(this.textTheme, this.receiverName);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        receiverName,
        textAlign: TextAlign.center,
        style: textTheme.headline.copyWith(
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
