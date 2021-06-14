import 'package:json_annotation/json_annotation.dart';

part 'blockSerialized.g.dart';

@JsonSerializable(explicitToJson: true)
class BlockSerialized {
  final String image;
  final int article;
  final String name;
  final price;

  BlockSerialized({
    required this.image,
    required this.name,
    required this.price,
    required this.article,
  });

  factory BlockSerialized.fromJson(Map<String, dynamic> json) =>
      _$BlockSerializedFromJson(json);
  Map<String, dynamic> toJson() => _$BlockSerializedToJson(this);
}
