// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableEntityAdapter extends TypeAdapter<TableEntity> {
  @override
  final int typeId = 3;

  @override
  TableEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableEntity(
      attendanceTime: fields[0] as String,
      leavingTime: fields[1] as String,
      dayName: fields[2] as String,
      hours: fields[3] as int,
      minutes: fields[4] as int,
      date: fields[5] as String,
      type: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TableEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.attendanceTime)
      ..writeByte(1)
      ..write(obj.leavingTime)
      ..writeByte(2)
      ..write(obj.dayName)
      ..writeByte(3)
      ..write(obj.hours)
      ..writeByte(4)
      ..write(obj.minutes)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
