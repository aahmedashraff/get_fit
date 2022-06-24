import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_exercise_model.g.dart';

@JsonSerializable()
class RoutineExerciseModel {
  int id;
  String title;
  String img;
  String main_video;
  String main_img;
  String description;
  String exercise_duration;
  String reps;
  String rest;
  List<String> images;
  List translations;
  List<Map<String, dynamic>> videos;
  List<Map<String, dynamic>> muscle;
  RoutineExerciseModel({
    @required this.id,
    @required this.img,
    @required this.title,
    @required this.main_img,
    @required this.main_video,
    @required this.translations,
    @required this.description,
    @required this.exercise_duration,
    @required this.reps,
    @required this.rest,
    @required this.images,
    @required this.videos,
    @required this.muscle,
  });
  factory RoutineExerciseModel.fromJson(Map<String, dynamic> data) =>
      _$RoutineExerciseModelFromJson(data);

  Map<String, dynamic> toJson() => _$RoutineExerciseModelToJson(this);
}
