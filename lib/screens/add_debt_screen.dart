import 'dart:io';
import 'dart:typed_data';
import 'package:debt_diary/widgets/add_debt/button_under_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network/models/debt/debt_model_hive.dart';
import 'package:network/models/history/history_model_hive.dart';
import 'package:repository/repository/repository.dart';

import '../widgets/add_debt/date_content.dart';
import '../widgets/add_debt/image_content.dart';
import '../widgets/add_debt/signature_content.dart';
import '../widgets/add_debt/textfield_content.dart';

class AddDebtScreen extends StatefulWidget {
  static const routeNamed = "/add-debt";

  @override
  _AddDebtScreenState createState() => _AddDebtScreenState();
}

class _AddDebtScreenState extends State<AddDebtScreen> {
  final Repository repository = Repository();
  final TextEditingController _receiverController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  File _pickedImage;
  DateTime _pickedDate;
  Uint8List _pickedSignature;

  void _selectedImage(File pickedImage) {
    setState(() => _pickedImage = pickedImage);
  }

  void _selectedDate(DateTime pickedDate) {
    setState(() => _pickedDate = pickedDate);
  }

  void _selectedSignature(Uint8List pickedSignature) {
    setState(() => _pickedSignature = pickedSignature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Debt"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ImageReceiver(onTap: _selectedImage),
                  TextfieldContent(
                    label: "Fill Receiver Name",
                    keyboardType: TextInputType.text,
                    controller: _receiverController,
                  ),
                  TextfieldContent(
                    label: "Fill Amount",
                    inputFormatter: [WhitelistingTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                  ),
                  DateContent(onPressed: _selectedDate),
                  SignatureContent(onPressed: _selectedSignature),
                ],
              ),
            ),
          ),
          ButtonUnderScreen(
            onPressed: _pickedImage == null ||
                    _pickedDate == null ||
                    _pickedSignature == null ||
                    _receiverController.text.isEmpty ||
                    _amountController.text.isEmpty ||
                    _pickedDate.isBefore(DateTime.now())
                ? null
                : () async {
                    return await repository
                        .addHistory(
                          historyModelhives: HistoryModelHive()
                            ..id = DateTime.now()
                            ..receiverName = _receiverController.text
                            ..amountDebt = int.tryParse(_amountController.text)
                            ..amountLack = int.tryParse(_amountController.text)
                            ..amountSubstract = 0
                            ..dateHistoryCreate = DateTime.now()
                            ..imageReceiver = _pickedImage.path
                            ..imageSignature = _pickedSignature
                            ..actionName = "add",
                        )
                        .then(
                          (_) => repository.addDebt(
                            context: context,
                            debtModelHive: DebtModelHive()
                              ..id = DateTime.now()
                              ..receiverName = _receiverController.text
                              ..amountDebt =
                                  int.tryParse(_amountController.text)
                              ..amountLack =
                                  int.tryParse(_amountController.text)
                              ..dateReturn = _pickedDate
                              ..dateBorrow = DateTime.now()
                              ..imageReceiver = _pickedImage.path
                              ..imageSignature = _pickedSignature,
                          ),
                        );
                  },
          )
        ],
      ),
    );
  }
}
