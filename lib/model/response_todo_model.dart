import 'dart:convert';

import 'package:flutter_todo_list_app/model/response_post_model.dart';

ResponsePost responseRequestFromJson(String str) =>
             ResponsePost.fromJson(json.decode(str));

String responseRequestToJson(ResponsePost data) =>
       json.encode(data.toJson());

class ResponsePost {
  int status;
  List<Data> data;

  ResponsePost({this.status, this.data});

  factory ResponsePost.fromJson(Map<String, dynamic> json)=>
      ResponsePost(
          status: json["status"],
          data: json["data"]);


  Map<String, dynamic> toJson() =>
      {"status": status, "data": data};
}
