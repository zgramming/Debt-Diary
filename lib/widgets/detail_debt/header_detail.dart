import 'package:flutter/material.dart';

class HeaderTextContent extends StatelessWidget {
  final TextTheme textTheme;
  final String nameHeader;
  HeaderTextContent(this.textTheme, this.nameHeader);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        nameHeader,
        style: textTheme.subhead.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
