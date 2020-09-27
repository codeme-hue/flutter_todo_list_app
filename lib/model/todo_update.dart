import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DataUpdateManipulation {
  String title;
  int completed;

  DataUpdateManipulation({
    @required this.title,
    @required this.completed,
  });

  Map<String, dynamic> toJson() => _$DataUpdateManipulationToJson(this);
}

DataUpdateManipulation _$DataUpdateManipulationFromJson(Map<String, dynamic> json) {
  return DataUpdateManipulation(
    title: json['title'] as String,
    completed: json['completed'] as int,
  );
}

Map<String, dynamic> _$DataUpdateManipulationToJson(DataUpdateManipulation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
    };