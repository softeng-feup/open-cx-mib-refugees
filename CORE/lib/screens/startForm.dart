import 'package:core/screens/formQuestions.dart';
import 'package:flutter/material.dart';
import 'package:core/screens/Initial.dart';

class StartForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Start();
  }
}

class Start extends State<StartForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CORE'),
        backgroundColor: new Color(0xFF002A72),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Initial();
            }));
          },
        ),
      ),
      body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/porto.PNG"), fit: BoxFit.cover),
          ),
          child: Center(
              child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FirstQuestion();
              }));
            },
            child: Text("START",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            color: new Color(0xFF002A72),
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
          ))),
    );
  }
}
