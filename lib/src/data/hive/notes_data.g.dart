// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesDataAdapter extends TypeAdapter<NotesData> {
  @override
  final int typeId = 0;

  @override
  NotesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesData(
      title: fields[0] as String,
      text: fields[1] as String,
    )..date = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, NotesData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
