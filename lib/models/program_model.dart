import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'program_model.g.dart';

@JsonSerializable()
class ProgramModel {
  int id;
  String title;
  String order;
  String img;
  String weeks;
  String type;
  String description;
  String category_id;

  ProgramModel(
      {@required this.order,
      @required this.title,
      @required this.id,
      @required this.category_id,
      @required this.description,
      @required this.img,
      @required this.type,
      @required this.weeks});
  factory ProgramModel.fromJson(Map<String, dynamic> data) =>
      _$ProgramModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);
}
