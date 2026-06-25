// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBudgetAdapter extends TypeAdapter<HiveBudget> {
  @override
  final int typeId = 1;

  @override
  HiveBudget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBudget(
      id: fields[0] as String,
      month: fields[1] as String,
      totalBudget: fields[2] as double,
      totalExpenses: fields[3] as double,
      categories: (fields[4] as List).cast<HiveBudgetCategory>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveBudget obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.totalBudget)
      ..writeByte(3)
      ..write(obj.totalExpenses)
      ..writeByte(4)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBudgetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveBudgetCategoryAdapter extends TypeAdapter<HiveBudgetCategory> {
  @override
  final int typeId = 2;

  @override
  HiveBudgetCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBudgetCategory(
      name: fields[0] as String,
      amount: fields[1] as double,
      color: fields[2] as int,
      icon: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBudgetCategory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBudgetCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
