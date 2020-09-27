import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/screen/page_add_modify.dart';
import 'package:flutter_todo_list_app/screen/page_home.dart';
import 'package:flutter_todo_list_app/screen/page_splash_screen.dart';

void main() => runApp(MyTodoListApp());


class MyTodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreenPage.id,
      routes: {
        SplashScreenPage.id: (context) => SplashScreenPage(),
        HomePage.id: (context) => HomePage(),
        PageAddModify.id: (context) => PageAddModify()
      },
    );
  }
}
