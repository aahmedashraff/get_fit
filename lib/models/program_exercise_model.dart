import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'program_exercise_model.g.dart';

@JsonSerializable()
class ProgramExerciseModel {
  int id;
  String title;
  String img;
  String main_video;
  String main_img;
  String program_id;
  String description;
  String exercise_duration;
  String week_id;
  String day_id;
  String sequence_id;
  String reps;
  String rest;
  List<String> images;
  List translations;
  Map<String, dynamic> sequence;
  List<Map<String, dynamic>> videos;
  List<Map<String, dynamic>> muscle;
  ProgramExerciseModel({
    @required this.id,
    @required this.img,
    @required this.main_img,
    @required this.main_video,
    @required this.title,
    @required this.translations,
    @required this.description,
    @required this.exercise_duration,
    @required this.reps,
    @required this.rest,
    @required this.images,
    @required this.videos,
    @required this.muscle,
    @required this.day_id,
    @required this.program_id,
    @required this.sequence,
    @required this.sequence_id,
    @required this.week_id,
  });
  factory ProgramExerciseModel.fromJson(Map<String, dynamic> data) =>
      _$ProgramExerciseModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProgramExerciseModelToJson(this);
}
