// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryModelHiveAdapter extends TypeAdapter<HistoryModelHive> {
  @override
  HistoryModelHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModelHive(
      id: fields[0] as DateTime,
      receiverName: fields[1] as String,
      amountDebt: fields[2] as int,
      amountLack: fields[3] as int,
      amountSubstract: fields[5] as int,
      dateHistoryCreate: fields[6] as DateTime,
      imageReceiver: fields[7] as String,
      imageSignature: fields[8] as Uint8List,
      actionName: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModelHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.receiverName)
      ..writeByte(2)
      ..write(obj.amountDebt)
      ..writeByte(3)
      ..write(obj.amountLack)
      ..writeByte(5)
      ..write(obj.amountSubstract)
      ..writeByte(6)
      ..write(obj.dateHistoryCreate)
      ..writeByte(7)
      ..write(obj.imageReceiver)
      ..writeByte(8)
      ..write(obj.imageSignature)
      ..writeByte(9)
      ..write(obj.actionName);
  }
}
