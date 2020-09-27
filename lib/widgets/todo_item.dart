import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/model/response_post_model.dart';

Widget itemTodo(Data todo) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  todo.title,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                //Text("${barang.title} buah")

                Checkbox(value: todo.completed)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
