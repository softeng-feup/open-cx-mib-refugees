import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';
import 'package:core/screens/info.dart';
import 'package:core/screens/program.dart';
import 'package:core/screens/login.dart';
import 'package:core/screens/plan.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getEmailValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String email = prefs.getString('email');
  if (email == 'admin@admin.com')
    return email;
  return null;
}

class Menu {
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
      Navigator.push(context, MaterialPageRoute(builder: (context)
      {
        return LoginPage();
      })
      );
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
        body: FutureBuilder<String>(
          future: getEmailValue(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return DecoratedBox(
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
                            makeDashboardItem("Plan", Icons.calendar_today, 5),
                            makeDashboardItem("Program", Icons.library_books, 3),
                            makeDashboardItem("Info", Icons.info, 4)
                          ],
                        ),
                      )
                  )
              );
            } else {
              return DecoratedBox(
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
              );
            }
          }
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
                //cenas
              } else if (position == 3) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Program();
                }));
              } else if (position == 4){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Info();
                }));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PlanPage();
                }));
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
                      size: 50.0,
                      color: Color(0xFF002A72),
                    )
                ),
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