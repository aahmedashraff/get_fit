// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramExerciseModel _$ProgramExerciseModelFromJson(Map<String, dynamic> json) {
  return ProgramExerciseModel(
    id: json['id'] as int,
    img: json['img'] as String,
    title: json['title'] as String,
    translations: json['translations'] as List,
    description: json['description'] as String,
    exercise_duration: json['exercise_duration'] as String,
    reps: json['reps'] as String,
    rest: json['rest'] as String,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    videos: (json['videos'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    muscle: (json['muscle'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    day_id: json['day_id'] as String,
    program_id: json['program_id'] as String,
    sequence: json['sequence'] as Map<String, dynamic>,
    sequence_id: json['sequence_id'] as String,
    week_id: json['week_id'] as String,
    main_img: json['main_img'] as String,
    main_video: json['main_video'] as String,
  );
}

Map<String, dynamic> _$ProgramExerciseModelToJson(
        ProgramExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'main_video': instance.main_video,
      'main_img': instance.main_img,
      'program_id': instance.program_id,
      'description': instance.description,
      'exercise_duration': instance.exercise_duration,
      'week_id': instance.week_id,
      'day_id': instance.day_id,
      'sequence_id': instance.sequence_id,
      'reps': instance.reps,
      'rest': instance.rest,
      'images': instance.images,
      'translations': instance.translations,
      'sequence': instance.sequence,
      'videos': instance.videos,
      'muscle': instance.muscle,
    };
