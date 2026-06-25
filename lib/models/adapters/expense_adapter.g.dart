// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveExpenseAdapter extends TypeAdapter<HiveExpense> {
  @override
  final int typeId = 0;

  @override
  HiveExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveExpense(
      id: fields[0] as String,
      category: fields[1] as String,
      amount: fields[2] as double,
      date: fields[3] as DateTime,
      description: fields[4] as String?,
      percentage: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HiveExpense obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.percentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
