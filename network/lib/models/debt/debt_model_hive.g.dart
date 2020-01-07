// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebtModelHiveAdapter extends TypeAdapter<DebtModelHive> {
  @override
  DebtModelHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebtModelHive(
      id: fields[0] as DateTime,
      receiverName: fields[1] as String,
      amountDebt: fields[2] as int,
      amountLack: fields[3] as int,
      dateBorrow: fields[5] as DateTime,
      dateReturn: fields[4] as DateTime,
      imageReceiver: fields[6] as String,
      imageSignature: fields[7] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, DebtModelHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.receiverName)
      ..writeByte(2)
      ..write(obj.amountDebt)
      ..writeByte(3)
      ..write(obj.amountLack)
      ..writeByte(4)
      ..write(obj.dateReturn)
      ..writeByte(5)
      ..write(obj.dateBorrow)
      ..writeByte(6)
      ..write(obj.imageReceiver)
      ..writeByte(7)
      ..write(obj.imageSignature);
  }
}
