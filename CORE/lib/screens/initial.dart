import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';

class Menu{
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
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
    if(choice == Menu.SignOut){
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
            child: Align(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.only(top: 185.0),
                  alignment: Alignment.bottomCenter,
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(30.0),
                    children: <Widget>[
                      makeDashboardItem("Form", Icons.assignment, 1),
                      makeDashboardItem("Schedule", Icons.calendar_today, 2),
                      makeDashboardItem("Program", Icons.library_books, 3),
                      makeDashboardItem("Info", Icons.info, 4)
                    ],
                  ),
                )
            )
        )
    );
  }

  Card makeDashboardItem(String title, IconData icon, int position) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1.0)),
          child: new InkWell(
            onTap: () {
              if (position == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StartForm();
                }));
              } else if (position == 2) {
                print('schedule');
              } else if (position == 3) {
                print('program');
              } else {
                print('info');
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 25.0),
                Center(
                    child: Icon(
                      icon,
                      size: 60.0,
                      color: Color(0xFF002A72),
                    )),
                SizedBox(height: 5.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}