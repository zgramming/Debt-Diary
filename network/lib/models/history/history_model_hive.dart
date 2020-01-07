import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'history_model_hive.g.dart';

@HiveType()
class HistoryModelHive extends HiveObject {
  @HiveField(0)
  DateTime id;
  @HiveField(1)
  String receiverName;
  @HiveField(2)
  int amountDebt;
  @HiveField(3)
  int amountLack;
  @HiveField(5)
  int amountSubstract;
  @HiveField(6)
  DateTime dateHistoryCreate;
  @HiveField(7)
  String imageReceiver;
  @HiveField(8)
  Uint8List imageSignature;
  @HiveField(9)
  String actionName;

  HistoryModelHive({
    this.id,
    this.receiverName,
    this.amountDebt,
    this.amountLack,
    this.amountSubstract,
    this.dateHistoryCreate,
    this.imageReceiver,
    this.imageSignature,
    this.actionName,
  });

  factory HistoryModelHive.fromJson(Map json) {
    return HistoryModelHive(
      id: json["id"],
      receiverName: json["receiverName"],
      amountDebt: json["amountDebt"],
      amountLack: json["amountLack"],
      amountSubstract: json["amountSubstract"],
      dateHistoryCreate: json["dateHistoryCreate"],
      imageReceiver: json["imageReceiver"],
      imageSignature: json["imageSignature"],
      actionName: json["actionName"],
    );
  }
  // Hive fields go here
}
