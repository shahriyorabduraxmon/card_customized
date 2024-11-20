// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveListModelAdapter extends TypeAdapter<HiveListModel> {
  @override
  final int typeId = 1;

  @override
  HiveListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveListModel(
      cards: (fields[0] as List).cast<HiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveListModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cards);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
