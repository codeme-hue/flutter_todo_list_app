import 'dart:convert';

import 'package:flutter_todo_list_app/model/response_post_model.dart';
import 'package:flutter_todo_list_app/model/response_todo_model.dart';
import 'package:flutter_todo_list_app/model/todo_insert.dart';
import 'package:flutter_todo_list_app/model/todo_update.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static final _host = 'https://api-mytodo.herokuapp.com/api/v1';
  static const headers = {
    'Content-Type': 'application/json'
  };


  static Future <List<Data>> getListBarang() async {
    List<Data> listBarang = [];
    final response = await http.get('$_host/todo/list'); //data json

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      ResponseData respBarang = ResponseData.fromJson(json);

      respBarang.data.forEach((item) {
        listBarang.add(item);
      });

      return listBarang;
    } else {
      return [];
    }
  }

  Future<ResponsePost> postBarang(DataManipulation item) {
    return http
        .post(_host + '/todo/add',
        headers: headers,
        body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 201) {
        ResponsePost responseRequest =
        ResponsePost.fromJson(jsonDecode(data.body));

        return responseRequest;
      } else {
        return null;
      }
    });
  }

  Future<ResponsePost> updateBarang(id, DataUpdateManipulation item) async {
    return http.put('$_host/todo/update/${id}',
        headers: headers,
        body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {
        ResponsePost responseRequest =
        ResponsePost.fromJson(jsonDecode(data.body));

        return responseRequest;
      } else {
        return null;
      }
    });
  }

  Future<ResponsePost> delBarang(id) async {
    return http.delete('$_host/todo/delete/${id}').then((value) {
      if (value.statusCode == 200) {
        ResponsePost responseRequest =
        ResponsePost.fromJson(jsonDecode(value.body));

        return responseRequest;
      } else {
        return null;
      }
    });
  }
}