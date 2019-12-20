import 'dart:convert';
import 'dart:async';

import 'package:core/screens/initial.dart';

import 'package:core/screens/change_lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Plan();
  }
}

class _Plan extends State<PlanPage> {
  var allItems;

  Future<List> getTalks() async {
    String url = 'http://10.0.2.2:5000/talks/';

    final response = await http.get(url);

    var r = jsonDecode(response.body);

    allItems = r;

    return allItems;
  }

  Widget getTitle(index) {
    if (allItems[index]['title'].length > 24) {
      return Text(allItems[index]['title'].toString().substring(0, 25) + "...",
          style: TextStyle(
              color: Color(0xFF002A72),
              fontSize: 16,
              fontWeight: FontWeight.bold));
    } else {
      return Text(allItems[index]['title'],
          style: TextStyle(
              color: Color(0xFF002A72),
              fontSize: 16,
              fontWeight: FontWeight.bold));
    }
  }

  @override
  Widget build(BuildContext context) {
    List attendance = [12,34,21,42,8,11,19,25,2,5];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("CORE"),
          backgroundColor: new Color(0xFF002A72),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.close),
                onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Initial();
                    }))),
          ],
        ),
        body: FutureBuilder<List>(
            future: getTalks(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    width: (MediaQuery.of(context).size.width),
                    child: ListView.builder(
                        itemCount: allItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  // ignore: unnecessary_statements
                                  return ChangeLecture(
                                    id: allItems[index]['_id'],
                                  );
                                }));
                              },
                              child: Container(
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              left: 30,
                                              right: 30),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                getTitle(index),
                                              ]),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                  allItems[index]['date']
                                                      .toString()
                                                      .substring(0, 10),
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFF002A72))),
                                              Text(
                                                  allItems[index]
                                                              ['initial_time']
                                                          .toString()
                                                          .substring(11, 16) +
                                                      " - " +
                                                      allItems[index]
                                                              ['final_time']
                                                          .toString()
                                                          .substring(11, 16),
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFF002A72))),
                                              Row(
                                                children: <Widget>[
                                                  Icon(Icons.person),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 5),
                                                    child: Text(
                                                        attendance[index].toString(),),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 7.0)
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
            }));
  }
}
