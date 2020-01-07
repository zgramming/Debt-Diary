import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'debt_model_hive.g.dart';

@HiveType()
class DebtModelHive extends HiveObject {
  @HiveField(0)
  DateTime id;
  @HiveField(1)
  String receiverName;
  @HiveField(2)
  int amountDebt;
  @HiveField(3)
  int amountLack;
  @HiveField(4)
  DateTime dateReturn;
  @HiveField(5)
  DateTime dateBorrow;
  @HiveField(6)
  String imageReceiver;
  @HiveField(7)
  Uint8List imageSignature;

  DebtModelHive({
    this.id,
    this.receiverName,
    this.amountDebt,
    this.amountLack,
    this.dateBorrow,
    this.dateReturn,
    this.imageReceiver,
    this.imageSignature,
  });
  factory DebtModelHive.fromJson(Map json) {
    return DebtModelHive(
      id: json["id"],
      receiverName: json["receiverName"],
      amountDebt: json["amountDebt"],
      amountLack: json["amountLack"],
      dateBorrow: json["dateBorrow"],
      dateReturn: json["dateReturn"],
      imageReceiver: json["imageReceiver"],
      imageSignature: json["imageSignature"],
    );
  }
}
