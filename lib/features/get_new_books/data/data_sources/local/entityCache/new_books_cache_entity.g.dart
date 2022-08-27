// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_books_cache_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewBooksCacheEntityAdapter extends TypeAdapter<NewBooksCacheEntity> {
  @override
  final int typeId = 1;

  @override
  NewBooksCacheEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewBooksCacheEntity(
      total: fields[0] as String,
      books: (fields[1] as List).cast<BooksCacheEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewBooksCacheEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewBooksCacheEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
