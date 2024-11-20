// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelAdapter extends TypeAdapter<HiveModel> {
  @override
  final int typeId = 0;

  @override
  HiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModel(
      cardImage: fields[0] as String,
      scale: fields[1] as double,
      xOffset: fields[2] as double,
      yOffset: fields[3] as double,
      cardColor: fields[4] as String,
      gradientColors: (fields[5] as List).cast<String>(),
      blur: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.cardImage)
      ..writeByte(1)
      ..write(obj.scale)
      ..writeByte(2)
      ..write(obj.xOffset)
      ..writeByte(3)
      ..write(obj.yOffset)
      ..writeByte(4)
      ..write(obj.cardColor)
      ..writeByte(5)
      ..write(obj.gradientColors)
      ..writeByte(6)
      ..write(obj.blur);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
