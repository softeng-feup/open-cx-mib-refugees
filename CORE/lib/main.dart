//import 'package:core/screens/initial.dart';
import 'package:core/screens/login.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'CORE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      //home: Initial(),
      home: LoginPage(),
    );
  }
}