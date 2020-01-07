// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelHiveAdapter extends TypeAdapter<UserModelHive> {
  @override
  UserModelHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModelHive(
      id: fields[0] as DateTime,
      giverName: fields[1] as String,
      darkMode: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserModelHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.giverName)
      ..writeByte(2)
      ..write(obj.darkMode);
  }
}
