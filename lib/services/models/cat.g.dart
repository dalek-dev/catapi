// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      json['name'] as String?,
      json['origin'] as String?,
      json['description'] as String?,
      json['intelligence'] as int?,
      json['adaptability'] as int?,
      json['life_span'] as String?,
      json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'name': instance.name,
      'origin': instance.countryOrigin,
      'description': instance.description,
      'intelligence': instance.intelligence,
      'adaptability': instance.adaptability,
      'life_span': instance.lifeSpan,
      'reference_image_id': instance.refenceImage,
    };

CatImage _$CatImageFromJson(Map<String, dynamic> json) => CatImage(
      json['id'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$CatImageToJson(CatImage instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
