// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'pixabay_image.g.dart';

@JsonSerializable()
class PixabayImage {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'tags')
  final String tags;

  @JsonKey(name: 'previewURL')
  final String previewURL;

  @JsonKey(name: 'largeImageURL')
  final String largeImageURL;

  const PixabayImage({
    required this.id,
    required this.tags,
    required this.previewURL,
    required this.largeImageURL,
  });

  factory PixabayImage.fromJson(Map<String, dynamic> json) => _$PixabayImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayImageToJson(this);
}
