import 'package:core/screens/formQuestions.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Initial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreen();
  }
}

class FirstScreen extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('CORE'),
    backgroundColor: new Color(0xFF002A72),),
    body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/cover.png"), fit: BoxFit.cover),
        ),
        child: Center(child:
        Text("")
        )));
  }

}
