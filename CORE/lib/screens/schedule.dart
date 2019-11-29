import 'package:flutter/material.dart';
import 'package:core/screens/rankings.dart';

class Schedule extends StatefulWidget {

  List<int> items;

  Schedule({Key key, this.items}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _Schedule();
  }
}

class _Schedule extends State<Schedule> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('CORE'),
          backgroundColor: new Color(0xFF002A72),),
      body: WeekView(items: widget.items),
    );
  }
}

class WeekView extends StatelessWidget {

  List<int> items;

  List allItems = [];

  WeekView({Key key, this.items}) : super(key: key);

  List _allItems = [
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

  static const d1 = '17/11/2019';
  static const day1 = 'Nov 17';
  static const d2 = '18/11/2019';
  static const day2 = 'Nov 18';
  static const d3 = '19/11/2019';
  static const day3 = 'Nov 19';

  List schedule = [
    {
      'h': 'Hour ',
      'd1': day1,
      'd2': day2,
      'd3': day3,
    },
    {
      'h': '08:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '08:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '08:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '08:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '09:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '09:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '09:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '09:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '10:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '10:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '10:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '10:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '11:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '11:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '11:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '11:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '12:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '12:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '12:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '12:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '13:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '13:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '13:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '13:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '14:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '14:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '14:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },    {
      'h': '14:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },

    {
      'h': '15:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '15:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '15:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '15:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },

    {
      'h': '16:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '16:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '16:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '16:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '17:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '17:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '17:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '17:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '18:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '18:15',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '18:30',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '18:45',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
    {
      'h': '19:00',
      'd1': 'Talk 0',
      'd2': 'Talk 0',
      'd3': 'Talk 0',
    },
  ];


  void getItems() {
    debugPrint(items.toString());
    debugPrint(allItems.toString());
    debugPrint(_allItems.toString());
    for(int i=0; i<items.length; i++) {
      allItems.add(_allItems[items[i]]);
    }
  }

  Map getTalk(String name) {
    int index = -1;
    for (int i = 0; i < allItems.length; i++) {
      if (allItems[i]['name'] == name) {
        index = i;
        break;
      }
    }
    return allItems[index];
  }

  void addTalks() {
    getItems();
    for (int k = 0; k < allItems.length; k++) {
      for (int i = 0; i < schedule.length; i++) {

        if (allItems[k]['start_hour'] == schedule[i]['h']) {
          switch (allItems[k]['date']) {
            case d1:
              schedule[i]['d1'] = allItems[k]['name'];
              break;
            case d2:
              schedule[i]['d2'] = allItems[k]['name'];
              break;
            case d3:
              schedule[i]['d3'] = allItems[k]['name'];
              break;
            default:
              break;
          }
        }
        if (allItems[k]['end_hour'] == schedule[i]['h']) {
          int n = 0;
          while(schedule[i-n]['h'] != allItems[k]['start_hour']) {
            switch (allItems[k]['date']) {
              case d1:
                schedule[i - n]['d1'] = allItems[k]['name'];
                break;
              case d2:
                schedule[i - n]['d2'] = allItems[k]['name'];
                break;
              case d3:
                schedule[i - n]['d3'] = allItems[k]['name'];
                break;
              default:
                break;
            }
            n=n+1;
          }
        }
      }
    }
  }

  void _showDialog(context, String title, String speaker, String abstract) {
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
              Text('Speaker: ${speaker}'),
              Text(''),
              Text(abstract, style: TextStyle(fontWeight: FontWeight.w300),),
            ],),
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

  @override
  Widget build(BuildContext context) {
    addTalks();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          color: Colors.grey[200],
        ),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: schedule.map((element) {
            return getSchedule(context, element);
          }).toList(),
        ),
      ),
    );
  }

  Widget getSchedule(context, item) {
    if (item['h'] == 'Hour ') {
      return Container(
          color: Colors.grey[200],
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 10, bottom: 30),
                      child: Text(
                        item['h'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 10, bottom: 30),
                      child: Text(
                        item['d1'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 10, bottom: 30),
                      child: Text(
                        item['d2'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 10, bottom: 30),
                      child: Text(
                        item['d3'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    } else {
      if (item['d1'] != 'Talk 0') {
        if(item['h'].toString().substring(3)=='00') {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          item = getTalk(item['d1']);
                          _showDialog(
                              context,
                              item['d1'] + " - " + item['title'],
                              item['speaker'],
                              item['abstract']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                              BorderSide(width: 2.0, color: Colors.grey[700]),
                            ),
                            color: Colors.green[200],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    item['d1'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d2'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d3'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
        else {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          item = getTalk(item['d1']);
                          _showDialog(
                              context,
                              item['d1'] + " - " + item['title'],
                              item['speaker'],
                              item['abstract']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                              BorderSide(width: 2.0, color: Colors.grey[700]),
                            ),
                            color: Colors.green[200],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    item['d1'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d2'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d3'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
      } else if (item['d2'] != 'Talk 0' && item['d2'] != day2) {

        if(item['h'].toString().substring(3)=='00') {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d1'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          int index = -1;
                          for (int i = 0; i < allItems.length; i++) {
                            if (allItems[i]['name'] == item['d2']) {
                              index = i;
                              break;
                            }
                          }
                          _showDialog(
                              context,
                              item['d2'] + " - " + allItems[index]['title'],
                              allItems[index]['speaker'],
                              allItems[index]['abstract']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                              BorderSide(width: 2.0, color: Colors.grey[700]),
                            ),
                            color: Colors.green[200],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    item['d2'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d3'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
        else {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d1'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          int index = -1;
                          for (int i = 0; i < allItems.length; i++) {
                            if (allItems[i]['name'] == item['d2']) {
                              index = i;
                              break;
                            }
                          }
                          _showDialog(
                              context,
                              item['d2'] + " - " + allItems[index]['title'],
                              allItems[index]['speaker'],
                              allItems[index]['abstract']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                              BorderSide(width: 2.0, color: Colors.grey[700]),
                            ),
                            color: Colors.green[200],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    item['d2'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d3'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }


      } else if (item['d3'] != 'Talk 0' && item['d3'] != day3) {
        if(item['h'].toString().substring(3)=='00') {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d1'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d2'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          int index = -1;
                          for (int i = 0; i < allItems.length; i++) {
                            if (allItems[i]['name'] == item['d3']) {
                              index = i;
                              break;
                            }
                          }
                          _showDialog(
                              context,
                              item['d3'] + " - " + allItems[index]['title'],
                              allItems[index]['speaker'],
                              allItems[index]['abstract']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                              BorderSide(width: 2.0, color: Colors.grey[700]),
                            ),
                            color: Colors.green[200],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    item['d3'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
        else {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d1'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d2'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          int index = -1;
                          for (int i = 0; i < allItems.length; i++) {
                            if (allItems[i]['name'] == item['d3']) {
                              index = i;
                              break;
                            }
                          }
                          _showDialog(
                              context,
                              item['d3'] + " - " + allItems[index]['title'],
                              allItems[index]['speaker'],
                              allItems[index]['abstract']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                              BorderSide(width: 2.0, color: Colors.grey[700]),
                            ),
                            color: Colors.green[200],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    item['d3'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }

      } else {
        if (item['h'].toString().substring(3) == '00') {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text(
                                  item['d1'],
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d2'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d3'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
        else {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                item['h'],
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text(
                                  item['d1'],
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d2'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.grey[700]),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 0),
                          child: Text(
                            item['d3'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }

      }
    }
  }
}
