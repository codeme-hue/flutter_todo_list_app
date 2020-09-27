import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DataManipulation {
  String title;

  DataManipulation({
    @required this.title,
  });

  Map<String, dynamic> toJson() => _$DataManipulationToJson(this);
}

DataManipulation _$DataManipulationFromJson(Map<String, dynamic> json) {
  return DataManipulation(
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$DataManipulationToJson(DataManipulation instance) =>
    <String, dynamic>{
      'title': instance.title,
    };