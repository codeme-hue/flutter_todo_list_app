import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DataDeleteManipulation {
  String id;

  DataDeleteManipulation({
    @required this.id,
  });

  Map<String, dynamic> toJson() => _$DataDeleteManipulationToJson(this);
}


DataDeleteManipulation _$DataDeleteManipulationFromJson(Map<String, dynamic> json) {
     return DataDeleteManipulation(
       id: json['id'] as String,
  );
}

Map<String, dynamic> _$DataDeleteManipulationToJson(DataDeleteManipulation instance) =>
    <String, dynamic>{
      'id': instance.id,
    };