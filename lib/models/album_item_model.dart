import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_item_model.g.dart';

@JsonSerializable()
class AlbumItemModel {
  int id;
  String image_before;
  String image_after;
  String user_id;
  Map<String, dynamic> user;
  
  AlbumItemModel({
    @required this.id,
    @required this.image_after,
    @required this.image_before,
    @required this.user,
    @required this.user_id,
    
    
  });
  factory AlbumItemModel.fromJson(Map<String, dynamic> data) =>
      _$AlbumItemModelFromJson(data);

  Map<String, dynamic> toJson() => _$AlbumItemModelToJson(this);
}
