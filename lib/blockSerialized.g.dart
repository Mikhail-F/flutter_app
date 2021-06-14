// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockSerialized.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockSerialized _$BlockSerializedFromJson(Map<String, dynamic> json) {
  return BlockSerialized(
    image: json['image'] as String,
    name: json['name'] as String,
    price: json['price'],
    article: json['article'] as int,
  );
}

Map<String, dynamic> _$BlockSerializedToJson(BlockSerialized instance) =>
    <String, dynamic>{
      'image': instance.image,
      'article': instance.article,
      'name': instance.name,
      'price': instance.price,
    };
