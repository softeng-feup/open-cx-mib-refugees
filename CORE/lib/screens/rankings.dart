import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:core/screens/schedule.dart';

class Rankings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rankings();
  }
}

class _Rankings extends State<Rankings> {

  final database = FirebaseDatabase.instance.reference().child("Program");
  List allLectures= new List();

  void getData() async {
    List allLec= new List();
    database.once().then((snap) {
      Map<dynamic,dynamic> map = snap.value;
      map.forEach((key, value) {
        var lecture=snap.value[key];
        allLec.add(lecture);
        debugPrint(lecture['title']);
      });
    });
    allLectures=allLec;
  }

  List allItems = [
    {
      'name': 'Talk 1',
      'title': 'The title of talk 1',
      'speaker': 'Jose Dias',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '17/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:15',
      'rank': '97%',
      'selected': false
    },
    {
      'name': 'Talk 2',
      'title': 'The title of talk 2',
      'speaker': 'Joao Pereira',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '17/11/2019',
      'start_hour': '12:15',
      'end_hour': '14:30',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 3',
      'title': 'The title of talk 3',
      'speaker': 'Maria Ribeiro',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '17/11/2019',
      'start_hour': '16:30',
      'end_hour': '18:00',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 4',
      'title': 'The title of talk 4',
      'speaker': 'Patricia Rocha',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '18/11/2019',
      'start_hour': '08:30',
      'end_hour': '09:00',
      'rank': '86%',
      'selected': false
    },
    {
      'name': 'Talk 5',
      'title': 'The title of talk 5',
      'speaker': 'Ines Vilarinho',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '18/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:00',
      'rank': '86%',
      'rank': '85%',
      'selected': false
    },
    {
      'name': 'Talk 6',
      'title': 'The title of talk 6',
      'speaker': 'Joao Afonso',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '18/11/2019',
      'start_hour': '14:00',
      'end_hour': '17:15',
      'rank': '81%',
      'selected': false
    },
    {
      'name': 'Talk 7',
      'title': 'The title of talk 7',
      'speaker': 'Jose Dias',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '18/11/2019',
      'start_hour': '10:00',
      'end_hour': '10:30',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 8',
      'title': 'The title of talk 8',
      'speaker': 'Ines Vilarinho',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '19/11/2019',
      'start_hour': '14:00',
      'end_hour': '15:45',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 9',
      'title': 'The title of talk 9',
      'speaker': 'Quim Barreiros',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'date': '19/11/2019',
      'start_hour': '17:15',
      'end_hour': '18:00',
      'rank': '70%',
      'selected': false
    }
  ];



  void _showDialog(String title, String speaker, String date, String start, String end, String abstract) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Speaker: " + speaker),
              Text(""),
              Text("Date: " + date),
              Text(""),
              Text("Hour: " + start + "-" + end),
              Text(""),
              Text(abstract, style: TextStyle(fontWeight: FontWeight.w300),),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget getCards(item) {
    var sel = false;

    return Padding(
      padding: EdgeInsets.only(top: 20, right: 30, left: 30),
      child: InkWell(
        onTap: () {
          _showDialog(item['title'], item['speaker'], item['date'], item['start_hour'], item['end_hour'], item['abstract']);
        },
        child: Container(
          child: Card(
              child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        item['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: item['selected'],
                        onChanged: (bool value) {
                          setState(() {
                            item['selected'] = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(item['speaker']),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.favorite),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(item['rank']),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
        ),
      ),
    );
  }

  Widget getRanking() {
    getData();
    return Container(
      child: ListView(
        children: allItems.map((element) {
          return getCards(element);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('CORE'),
            backgroundColor: new Color(0xFF002A72),),
        body: Center(child: getRanking()),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 100, right: 100, bottom: 20),
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: () {
                    List<int> items = [];
                    for(var i=0; i<allItems.length; i++) {
                      if(allItems[i]['selected'] == true) {
                        items.add(i);
                      }
                    }
                    debugPrint("Talks selected: " + items.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Schedule(items: items);
                    }));
                  },
                  child: Text("Done", style: TextStyle(color: Colors.white)),
                  color: new Color(0xFF002A72),
                  elevation: 5,
                ))));
  }
}
