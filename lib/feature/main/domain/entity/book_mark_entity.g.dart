// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_mark_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkEntityAdapter extends TypeAdapter<BookMarkEntity> {
  @override
  final int typeId = 0;

  @override
  BookMarkEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMarkEntity(
      id: fields[5] as int,
      originalTitle: fields[0] as String,
      overview: fields[1] as String,
      popularity: fields[2] as double,
      posterPath: fields[3] as String,
      voteCount: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BookMarkEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.originalTitle)
      ..writeByte(1)
      ..write(obj.overview)
      ..writeByte(2)
      ..write(obj.popularity)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.voteCount)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
