import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  int id;
  String title;
  String img;
  String description;
  String created_at;
  String level_id;
  String updated_at;
  String deleted_at;
  List translations;
  ArticleModel({
    @required this.description,
    @required this.created_at,
    @required this.id,
    @required this.img,
    @required this.title,
    @required this.deleted_at,
    @required this.level_id,
    @required this.translations,
    @required this.updated_at,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> data) =>
      _$ArticleModelFromJson(data);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
