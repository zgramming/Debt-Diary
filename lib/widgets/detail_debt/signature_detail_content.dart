import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../widgets/detail_debt/header_detail.dart';

class SignatureDetailContent extends StatelessWidget {
  final TextTheme textTheme;
  final Uint8List imageSignature;
  SignatureDetailContent(this.textTheme, this.imageSignature);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderTextContent(textTheme, "Signature Detail"),
          SizedBox(height: 20),
          Container(
            child: Image.memory(
              imageSignature,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
