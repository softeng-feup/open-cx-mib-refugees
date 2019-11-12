import 'package:core/screens/formQuestions.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class StartForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Start();
  }
}

class Start extends State<StartForm> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/porto.PNG"), fit: BoxFit.cover),
    ),
    child: Center(child:
    RaisedButton(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
    return FirstQuestion();
    }));
    },
      child: Text("START", style: TextStyle(color: Colors.white,
    fontSize: 20)),
    color: new Color(0xFF002A72),
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
    )
    ));

  }
}