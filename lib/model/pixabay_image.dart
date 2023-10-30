// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'pixabay_image.g.dart';

@JsonSerializable()
class PixabayImage {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'tags')
  String tags;

  @JsonKey(name: 'previewURL')
  String previewURL;

  PixabayImage({
    required this.id,
    required this.tags,
    required this.previewURL,
  });

  factory PixabayImage.fromJson(Map<String, dynamic> json) => _$PixabayImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayImageToJson(this);
}
