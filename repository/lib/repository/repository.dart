import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:network/models/history/history_model_hive.dart';
import 'package:network/models/debt/debt_model_hive.dart';
import 'package:network/models/user/user_model_hive.dart';

class Repository {
  final String historyBox = "history_box";
  final String debtBox = "debt_box";
  final String userBox = "user_box";

  Future<void> nextPageView(PageController pageController) async {
    return await pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  Future<void> previousPageView(PageController pageController) async {
    return await pageController.previousPage(
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  Future<void> addUserSession({
    @required UserModelHive userModelHive,
    @required String routeName,
  }) async {
    final hiveBox = Hive.box(userBox);
    final valueBox = userModelHive;
    return await hiveBox.put("userSession", valueBox);
  }

  Future<void> addDebt({
    @required BuildContext context,
    @required DebtModelHive debtModelHive,
  }) async {
    final hiveBox = Hive.box(debtBox);
    final valueBox = debtModelHive;
    final actionBox =
        await hiveBox.add(valueBox).then((_) => Navigator.of(context).pop());
    // print(actionBox);
    return actionBox;
  }

  Future<void> deleteDebt({
    @required Box boxName,
    @required int index,
    @required GlobalKey<ScaffoldState> scaffoldKey,
    @required SnackBar snackBar,
  }) async {
    final hiveBox = boxName;
    final actionBox = await hiveBox
        .deleteAt(index)
        .then((_) => scaffoldKey.currentState.showSnackBar(snackBar));
    return actionBox;
  }

  Future<void> undoDebt({
    @required Box boxName,
    @required int index,
    @required DebtModelHive debtModelHive,
  }) async {
    final hiveBox = boxName;
    final valueBox = debtModelHive;
    final actionBox = await hiveBox.put(index, valueBox);
    return actionBox;
  }

  Future<void> substractDebt({
    @required BuildContext context,
    @required Box boxName,
    @required int index,
    @required DebtModelHive debtModelHive,
  }) async {
    final hiveBox = boxName;
    final valueBox = debtModelHive;
    final actionBox = await hiveBox
        .put(index, valueBox)
        .then((_) => Navigator.of(context).pop());
    return actionBox;
  }

  Future<void> addHistory({
    @required HistoryModelHive historyModelhives,
  }) async {
    final hiveBox = Hive.box(historyBox);
    final valueBox = historyModelhives;
    final actionBox = await hiveBox.add(valueBox);
    return actionBox;
  }

  Future<void> changeThemeApp({@required UserModelHive userModelHive}) async {
    final hiveBox = Hive.box(userBox);
    final valueBox = userModelHive;
    final actionBox = await hiveBox.put("userSession", valueBox);
    return actionBox;
  }

  Future<void> changeFingerPrint(
      {@required UserModelHive userModelHive}) async {
    final hiveBox = Hive.box(userBox);
    final valueBox = userModelHive;
    final actionBox = await hiveBox.put("userSession", valueBox);
    return actionBox;
  }

  Future<void> changeDateExit({@required UserModelHive userModelHive}) async {
    final hiveBox = Hive.box(userBox);
    final valueBox = userModelHive;
    final actionBox = await hiveBox.put("userSession", valueBox);
    return actionBox;
  }

  Future<void> changeDurationToken(
      {@required UserModelHive userModelHive}) async {
    final hiveBox = Hive.box(userBox);
    final valueBox = userModelHive;
    final actionBox = await hiveBox.put("userSession", valueBox);
    return actionBox;
  }

  Future<void> changeTokenExpiryStatus(
      {@required UserModelHive userModelHive}) async {
    final hiveBox = Hive.box(userBox);
    final valueBox = userModelHive;
    final actionBox = await hiveBox.put("userSession", valueBox);
    return actionBox;
  }

  //*Batas
}
