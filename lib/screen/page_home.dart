import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/model/response_post_model.dart';
import 'package:flutter_todo_list_app/screen/page_add_modify.dart';
import 'package:flutter_todo_list_app/service/api_sevice.dart';
import 'package:flutter_todo_list_app/widgets/todo_item.dart';

class HomePage extends StatelessWidget {
  static const String id = "HOMEPAGE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: GridTodo(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageAddModify(
                        todo: null,
                      )));
        },
      ),
    );
  }
}

class GridTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<Data>>(
              future: ApiService.getListBarang(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  List<Data> listTodo = snapshot.data;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: listTodo?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Color(0xff329cef),
                        borderRadius: BorderRadius.circular(10.0),
                        child: itemTodo(listTodo[index]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PageAddModify(todo: listTodo[index])));
                        },
                      );
                    },
                  );
                }
              },
            )));
  }
}
