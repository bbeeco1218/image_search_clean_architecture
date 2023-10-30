// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixabayImage _$PixabayImageFromJson(Map<String, dynamic> json) => PixabayImage(
      id: json['id'] as int,
      tags: json['tags'] as String,
      previewURL: json['previewURL'] as String,
    );

Map<String, dynamic> _$PixabayImageToJson(PixabayImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
    };
