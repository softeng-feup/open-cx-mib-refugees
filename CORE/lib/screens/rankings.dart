import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:core/screens/schedule.dart';
import 'package:http/http.dart' as http;

class Rankings extends StatefulWidget {
  final List<String> answers;

  Rankings({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Rankings();
  }
}

class _Rankings extends State<Rankings> {
  var allItems;
  List ranking;
  List orderedItems;
  List<bool> selection = List.filled(1000, false);

  Future<List> getTalks() async {
    String url = 'http://10.0.2.2:5000/talks/';

    final response = await http.get(url);

    var r = jsonDecode(response.body);

    allItems = r;

    print(allItems.runtimeType);

    return allItems;
  }

  void rankingAlgorithm(allItems, answers) {

    List ranks = List(allItems.length);

    debugPrint("Running ranking...");

    List<double> typeScoresLabel = [100, 80, 60, 40, 20];
    List<double> categoryScoresLabel = [0, 15, 50, 85, 100];

    double categoryScore;
    double typeScore;
    double speakerScore;

    //CATEGORY -------------------------------------------------
    for (int i = 0; i < allItems.length; i++) {
      if (allItems[i]['category'] == 1 ||
          allItems[i]['category'] == 9 ||
          allItems[i]['category'] == 10 ||
          allItems[i]['category'] == 11 ||
          allItems[i]['category'] == 12) {
        categoryScore = 50;
      } else {
        int cat = allItems[i]['category'];
        int ans = int.parse(answers[cat - 1]);
        categoryScore = categoryScoresLabel[ans];
      }

      //TYPE -------------------------------------------------
      List<String> order =
          answers[8].substring(1, answers[8].length - 1).split(', ');
      String type = allItems[i]['type'];

      int index = -1;
      for (int k = 0; k < order.length; k++) {
        if (type.toUpperCase() == order[k].toUpperCase()) {
          index = k;
        }
      }

      if (index == -1) {
        typeScore = 50;
      } else {
        typeScore = typeScoresLabel[index];
      }

      //SPEAKER -------------------------------------------------
      String wantedSpeaker = answers[9];
      String speaker = allItems[i]['speaker'][0];
      if (speaker.toUpperCase() == wantedSpeaker.toUpperCase()) {
        speakerScore = 100;
      } else {
        speakerScore = 0;
      }

      double rank =
          categoryScore * 0.45 + typeScore * 0.45 + speakerScore * 0.1;
      ranks[i] = rank.round();
    }

    ranking = ranks;
  }

  void _showDialog(String title, String speaker, String date, String start,
      String end, String abstract) {
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
              new Expanded(
                  child: new SingleChildScrollView(
                child: new Text(
                  abstract,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              )),
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

  Widget getTitle(index) {
    if (allItems[index]['title'].length > 24) {
      return Text(allItems[index]['title'].toString().substring(0, 25) + "...",
          style: TextStyle(color: Color(0xFF002A72)));
    } else {
      return Text(allItems[index]['title'],
          style: TextStyle(color: Color(0xFF002A72)));
    }
  }

  List sortByRank() {
    List orderedLectures = [];

    List ranks = Set.of(ranking).toList();
    ranks.sort();
    ranks = ranks.reversed.toList();

    List r = [];

    for (int i = 0; i < ranks.length; i++) {
      for (int j = 0; j < ranking.length; j++) {
        if (ranking[j] == ranks[i]) {
          orderedLectures.add(allItems[j]);
          r.add(ranking[j]);
        }
      }
    }

    ranking = r;

    return orderedLectures;
  }

  List addChosenTalks() {
    List chosen = [];
    for (int i = 0; i < orderedItems.length; i++) {
      if(selection[i] == true) {
        chosen.add(orderedItems[i]['_id']);
      }
    }
    return chosen;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('CORE'),
          backgroundColor: new Color(0xFF002A72),
        ),
        body: FutureBuilder<List>(
            future: getTalks(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                rankingAlgorithm(allItems, widget.answers);
                orderedItems = sortByRank();
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    width: (MediaQuery.of(context).size.width),
                    child: ListView.builder(
                        itemCount: orderedItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: InkWell(
                              onTap: () {
                                _showDialog(
                                    orderedItems[index]['title'],
                                    orderedItems[index]['speaker'][0],
                                    orderedItems[index]['date']
                                        .toString()
                                        .substring(0, 10),
                                    orderedItems[index]['initial_time']
                                        .toString()
                                        .substring(11, 16),
                                    orderedItems[index]['final_time']
                                        .toString()
                                        .substring(11, 16),
                                    orderedItems[index]['description']);
                              },
                              child: Container(
                                child: Card(
                                    child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                orderedItems[index]['title'],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Checkbox(
                                              activeColor: Colors.blueGrey[400],
                                              value: selection[index],
                                              onChanged: (bool value) {
                                                setState(() {
                                                  selection[index] = value;
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
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.person),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                      orderedItems[index]
                                                          ['speaker'][0]),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.favorite),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(ranking[index]
                                                          .toString() +
                                                      "%"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 10.0)
                                ]),
                              ),
                            ),
                          );
                        }),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            new Color(0xFF002A72)),
                        strokeWidth: 8,
                      ),
                      width: 80,
                      height: 80,
                    ),
                  ),
                );
              }
            }),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 100, right: 100, bottom: 10),
            child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          selection = List.filled(1000, false);
                        });
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
                      ),
                      color: Colors.white,
                    ),
                    RaisedButton(
                      onPressed: () {
                        List chosen = addChosenTalks();
                        debugPrint(chosen.toString());
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Schedule();
                        }));
                      },
                      child: Text("Done", style: TextStyle(color: Colors.white)),
                      color: new Color(0xFF002A72),
                    )
                  ],
                ))));
  }
}
