// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return ArticleModel(
    description: json['description'] as String,
    created_at: json['created_at'] as String,
    id: json['id'] as int,
    img: json['img'] as String,
    title: json['title'] as String,
    deleted_at: json['deleted_at'] as String,
    level_id: json['level_id'] as String,
    translations: json['translations'] as List,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'description': instance.description,
      'created_at': instance.created_at,
      'level_id': instance.level_id,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'translations': instance.translations,
    };
