import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_model.g.dart';

@JsonSerializable()
class RoutineModel {
  int id;
  String title;
  String img;
  String created_at;
  String updated_at;
  String deleted_at;
  String rounds;
  List translations;
  RoutineModel({
    @required this.created_at,
    @required this.id,
    @required this.img,
    @required this.title,
    @required this.deleted_at,
    @required this.translations,
    @required this.updated_at,
    @required this.rounds,
  });
  factory RoutineModel.fromJson(Map<String, dynamic> data) =>
      _$RoutineModelFromJson(data);

  Map<String, dynamic> toJson() => _$RoutineModelToJson(this);
}
