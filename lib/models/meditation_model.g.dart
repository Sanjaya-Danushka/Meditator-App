// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeditationContentAdapter extends TypeAdapter<MeditationContent> {
  @override
  final int typeId = 0;

  @override
  MeditationContent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeditationContent(
      category: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      duration: fields[3] as int,
      audioUrl: fields[4] as String,
      videoUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MeditationContent obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.audioUrl)
      ..writeByte(5)
      ..write(obj.videoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeditationContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
