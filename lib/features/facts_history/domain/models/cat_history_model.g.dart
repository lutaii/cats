// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatHistoryModelAdapter extends TypeAdapter<CatHistoryModel> {
  @override
  final int typeId = 1;

  @override
  CatHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatHistoryModel(
      fields[0] as String,
      fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CatHistoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
