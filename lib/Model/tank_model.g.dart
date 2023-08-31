// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TankAdapter extends TypeAdapter<Tank> {
  @override
  final int typeId = 0;

  @override
  Tank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tank(
      tankName: fields[0] as String,
      currentROB: fields[1] as double,
      totalCapacity: fields[2] as double,
      tankType: fields[3] as String,
      tankOperations: (fields[4] as List).cast<String>(),
      performedOperations: (fields[5] as List?)?.cast<Operations>(),
    );
  }

  @override
  void write(BinaryWriter writer, Tank obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.tankName)
      ..writeByte(1)
      ..write(obj.currentROB)
      ..writeByte(2)
      ..write(obj.totalCapacity)
      ..writeByte(3)
      ..write(obj.tankType)
      ..writeByte(4)
      ..write(obj.tankOperations)
      ..writeByte(5)
      ..write(obj.performedOperations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OperationsAdapter extends TypeAdapter<Operations> {
  @override
  final int typeId = 1;

  @override
  Operations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Operations(
      tankName: fields[0] as String,
      currentROB: fields[1] as double,
      totalCapacity: fields[2] as double,
      operationName: fields[4] as String,
      targetTank: fields[3] as String?,
      amount: fields[5] as double,
      lastROB: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Operations obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.tankName)
      ..writeByte(1)
      ..write(obj.currentROB)
      ..writeByte(2)
      ..write(obj.totalCapacity)
      ..writeByte(3)
      ..write(obj.targetTank)
      ..writeByte(4)
      ..write(obj.operationName)
      ..writeByte(5)
      ..write(obj.amount)
      ..writeByte(6)
      ..write(obj.lastROB);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
