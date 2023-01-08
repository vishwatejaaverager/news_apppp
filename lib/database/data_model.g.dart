// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsDataModelAdapter extends TypeAdapter<NewsDataModel> {
  @override
  final int typeId = 8;

  @override
  NewsDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsDataModel(
      title: fields[1] as String?,
      source: (fields[2] as Map?)?.cast<String, dynamic>(),
      urlToImage: fields[3] as String?,
      content: fields[4] as String?,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsDataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.source)
      ..writeByte(3)
      ..write(obj.urlToImage)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
