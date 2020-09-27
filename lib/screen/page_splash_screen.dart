import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_todo_list_app/screen/page_home.dart';

class SplashScreenPage extends StatefulWidget {
  static const String id = "PAGESPLASHSCREEN";

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff329cef),
    );
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomePage();
      }));
    });
  }
}
