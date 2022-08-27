// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_cache_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksCacheEntityAdapter extends TypeAdapter<BooksCacheEntity> {
  @override
  final int typeId = 2;

  @override
  BooksCacheEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksCacheEntity(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      isbn13: fields[2] as String,
      price: fields[3] as String,
      image: fields[4] as String,
      url: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BooksCacheEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.isbn13)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksCacheEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
