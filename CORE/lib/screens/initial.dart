import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';

class Menu{
  static const String Program = 'Program';
  static const String Form = 'Form';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
    Form,
    Program,
    SignOut,
  ];
}

class Initial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreen();
  }
}

class FirstScreen extends State<Initial> {

  void choiceAction(String choice){
    if(choice == Menu.Form){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StartForm();
      }));
    }else if(choice == Menu.Program){
      print('Subscribe');
    }else if(choice == Menu.SignOut){
      print('SignOut');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('CORE'),
          backgroundColor: new Color(0xFF002A72),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return Menu.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/cover.png"), fit: BoxFit.cover),
            ),
            child: Center(child: Text(""))));
  }
}
