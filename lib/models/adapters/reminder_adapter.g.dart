// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveReminderAdapter extends TypeAdapter<HiveReminder> {
  @override
  final int typeId = 4;

  @override
  HiveReminder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveReminder(
      id: fields[0] as String,
      title: fields[1] as String,
      status: fields[2] as String,
      finalDate: fields[3] as DateTime,
      daysLeft: fields[4] as int,
      category: fields[5] as String,
      description: fields[6] as String?,
      isChecked: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveReminder obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.finalDate)
      ..writeByte(4)
      ..write(obj.daysLeft)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveReminderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
