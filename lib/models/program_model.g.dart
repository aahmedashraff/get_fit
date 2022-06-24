// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) {
  return ProgramModel(
    order: json['order'] as String,
    title: json['title'] as String,
    id: json['id'] as int,
    description:json['description'] as String,
    category_id: json['category_id'] as String,
    img: json['img'] as String,
    type: json['type'] as String,
    weeks: json['weeks'] as String,
  );
}

Map<String, dynamic> _$ProgramModelToJson(ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order': instance.order,
      'img': instance.img,
      'weeks': instance.weeks,
      'type': instance.type,
      'category_id': instance.category_id,
      'description':instance.description
    };
