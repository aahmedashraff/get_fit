import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int id;
  String name;
  String order;
 
  CategoryModel({
    @required this.order,
    @required this.name,
    @required this.id,
   
  });
  factory CategoryModel.fromJson(Map<String, dynamic> data) =>
      _$CategoryModelFromJson(data);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
