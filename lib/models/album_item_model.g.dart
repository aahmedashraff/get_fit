// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumItemModel _$AlbumItemModelFromJson(Map<String, dynamic> json) {
  return AlbumItemModel(
    id: json['id'] as int,
    image_after: json['image_after'] as String,
    image_before: json['image_before'] as String,
    user: json['user'] as Map<String, dynamic>,
    user_id: json['user_id'] as String,
  );
}

Map<String, dynamic> _$AlbumItemModelToJson(AlbumItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_before': instance.image_before,
      'image_after': instance.image_after,
      'user_id': instance.user_id,
      'user': instance.user,
    };
