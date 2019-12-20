import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Program extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Program();
  }
}

class _Program extends State<Program>{

  var allItems;

  dynamic getTalks() async {

    String url = 'http://10.0.2.2:5000/talks/';

    final response = await http.get(url);

    var r = jsonDecode(response.body);

    allItems = r;

    return r;

  }
/*
  @override
  void initState() {

    getTalks().then((result) {
      // If we need to rebuild the widget with the resulting data,
      // make sure to use `setState`
      setState(() {
        talks = result;
        //print(result);
        time = result[0]['final_time'];
      });
    });

  }
*/
  @override
  Widget build(BuildContext context) {

    getTalks();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("CORE"),
            backgroundColor: new Color(0xFF002A72),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back), onPressed: () {})),
        body: Builder
          (builder: (context)=> Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:10,bottom: 10),
                    child: Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width )  ,
                      child: ListView.builder(
                          itemCount: allItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Container(
                                  child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:10,bottom:20 ),
                                        child: Column(
                                          children: <Widget>[
                                            Center(
                                              child: Padding(
                                                padding:
                                                EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                          allItems[index]['_id'],
                                                          style: TextStyle(
                                                              color: Color(0xFF002A72))),
                                                    ]
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 10),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                        "date",
                                                        style: TextStyle(
                                                            color: Color(0xFF002A72))),
                                                    Text(
                                                        allItems[index]['initial_time'].toString().substring(14,19) + " - " + allItems[index]['final_time'].toString().substring(14,19),
                                                        style: TextStyle(
                                                            color: Color(0xFF002A72))),
                                                    Text("69",
                                                        style: TextStyle(
                                                            color: Color(0xFF002A72))
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(color: Colors.black12,
                                            blurRadius: 7.0)
                                      ]),
                                ),
                              );
                          }


                      ),
                    ),
                  ),
                ]
            )))

    );



  }



}
