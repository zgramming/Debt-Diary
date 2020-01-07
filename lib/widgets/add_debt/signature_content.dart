import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_signature_view/flutter_signature_view.dart';

class SignatureContent extends StatefulWidget {
  final Function onPressed;
  SignatureContent({this.onPressed});
  @override
  _SignatureContentState createState() => _SignatureContentState();
}

class _SignatureContentState extends State<SignatureContent> {
  SignatureView _signatureView;
  Uint8List _resultExportSignature;
  void _exportSignatureToBytes() async {
    if (_signatureView == null) {
      print(_signatureView.toString());
      return;
    }
    final signatureToBytes = await _signatureView.exportBytes();
    _resultExportSignature = signatureToBytes;
    print(_resultExportSignature.toString());
    widget.onPressed(_resultExportSignature);
  }

  @override
  Widget build(BuildContext context) {
    _signatureView = SignatureView(
      backgroundColor: Theme.of(context).accentColor,
      penStyle: Paint()
        ..color = Colors.white
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            child: _resultExportSignature == null
                ? SizedBox()
                : Image.memory(
                    _resultExportSignature,
                    fit: BoxFit.cover,
                    color: Theme.of(context).primaryColor,
                  ),
          ),
          Container(
            child: _signatureView,
            height: 150,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: FlatButton.icon(
                    onPressed: () => _signatureView.clear(),
                    icon: Icon(Icons.refresh),
                    label: Text("Reset"),
                  ),
                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: _exportSignatureToBytes,
                    icon: Icon(Icons.check),
                    label: Text("Confirm"),
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
