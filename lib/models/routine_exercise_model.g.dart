// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineExerciseModel _$RoutineExerciseModelFromJson(Map<String, dynamic> json) {
  return RoutineExerciseModel(
    id: json['id'] as int,
    img: json['img'] as String,
    title: json['title'] as String,
    translations: json['translations'] as List,
    description: json['description'] as String,
    exercise_duration: json['exercise_duration'] as String,
    reps: json['reps'] as String,
    rest: json['rest'] as String,
    main_img: json['main_img'] as String,
    main_video: json['main_video'] as String,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    videos: (json['videos'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    muscle: (json['muscle'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
  );
}

Map<String, dynamic> _$RoutineExerciseModelToJson(
        RoutineExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'description': instance.description,
      'exercise_duration': instance.exercise_duration,
      'reps': instance.reps,
      'rest': instance.rest,
      'images': instance.images,
      'translations': instance.translations,
      'videos': instance.videos,
      'muscle': instance.muscle,
      'main_video': instance.main_video,
      'main_img': instance.main_img,
    };
