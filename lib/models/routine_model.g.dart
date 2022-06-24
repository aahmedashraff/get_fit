// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineModel _$RoutineModelFromJson(Map<String, dynamic> json) {
  return RoutineModel(
    created_at: json['created_at'] as String,
    id: json['id'] as int,
    img: json['img'] as String,
    title: json['title'] as String,
    deleted_at: json['deleted_at'] as String,
    translations: json['translations'] as List,
    updated_at: json['updated_at'] as String,
    rounds: json['rounds'] as String,
  );
}

Map<String, dynamic> _$RoutineModelToJson(RoutineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'rounds': instance.rounds,
      'translations': instance.translations,
    };
