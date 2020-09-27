import 'dart:convert';

ResponseData responseTodoFromJson(String str) =>
             ResponseData.fromJson(json.decode(str));

      String responseTodoToJson(ResponseData data) =>
             json.encode(data.toJson());

class ResponseData {
  int status;
  List<Data> data;

  ResponseData({
    this.status,
    this.data,
  });


  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      ResponseData(
        status: json["status"],
        data: List<Data>.
        from(json["data"].map((x) => Data.fromJson(x))),
      );


  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}


class Data {
  int id;
  String title;
  final bool completed;

  Data({
    this.id,
    this.title,
    this.completed,
  });

  set completed(bool value) {
      completed = value;

    assert(value != null);
  }


  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "completed": completed
      };
}