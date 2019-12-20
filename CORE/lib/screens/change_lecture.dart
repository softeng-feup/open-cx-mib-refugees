import 'package:flutter/material.dart';
import 'package:core/screens/plan.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';


class ChangeLecture extends StatefulWidget {
  final String id;
  ChangeLecture({Key key, @required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return Lecture();
  }
}

class Lecture extends State<ChangeLecture> {

  var allItems;

  Future<Map> getTalks() async {

    String url = 'http://10.0.2.2:5000/talks/'+ widget.id;

    final response = await http.get(url);

    var r = jsonDecode(response.body);

    allItems = r;
    print(r);

    return r;

  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () {

        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              // ignore: unnecessary_statements
              return PlanPage();
            }));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation",
          style: TextStyle(
              color: Color(0xFF002A72))),
      content: Text("Are you sure that wish to save the alterations?",
          style: TextStyle(
              color: Color(0xFF002A72))),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }





  String _date="Not set";
  String _start_time="Not set";
  String _end_time="Not set";

  DateTime time_start;
  DateTime time_end;
  DateTime date1;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getTalks();

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text('CORE'),
            backgroundColor: new Color(0xFF002A72),
            automaticallyImplyLeading: false,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.close),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PlanPage();
                }))
            ),
          ],
        ),
        body:
        FutureBuilder<Map>(
            future: getTalks(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Text(allItems['title'].toString(),
                              style: TextStyle(
                                  color: Color(0xFF002A72),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0))

                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(15),
                        child: Text(allItems['speaker'][0],
                            style: TextStyle(
                                color: Color(0xFF002A72),
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0))
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: <Widget>[


                            Text(
                                'Date'
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                elevation: 4.0,
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      theme: DatePickerTheme(
                                        containerHeight: 210.0,
                                      ),
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(2022, 12, 31),
                                      onConfirm: (date) {
                                        print('confirm_DATE $date');
                                        date1 = date;
                                        _date =
                                        '${date.year} - ${date.month} - ${date
                                            .day}';
                                        setState(() {});
                                      },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.date_range,
                                                  size: 18.0,
                                                  color: Color(0xFF002A72),
                                                ),
                                                Text(
                                                  _date,
                                                  style: TextStyle(
                                                      color: Color(0xFF002A72),
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "  Change",
                                        style: TextStyle(
                                            color: Color(0xFF002A72),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                                'Start Hour'
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                elevation: 4.0,
                                onPressed: () {
                                  DatePicker.showTimePicker(context,
                                      theme: DatePickerTheme(
                                        containerHeight: 210.0,
                                      ),
                                      showTitleActions: true,
                                      onConfirm: (time) {
                                        print('confirm $time');
                                        time_start = time;
                                        _start_time =
                                        "${time.hour} : ${time.minute} : ${time
                                            .second}";
                                        setState(() {});
                                      },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.access_time,
                                                  size: 18.0,
                                                  color: Color(0xFF002A72),
                                                ),
                                                Text(
                                                  _start_time,
                                                  style: TextStyle(
                                                      color: Color(0xFF002A72),
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "  Change",
                                        style: TextStyle(
                                            color: Color(0xFF002A72),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                                'End Hour'
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                elevation: 4.0,
                                onPressed: () {
                                  DatePicker.showTimePicker(context,

                                      theme: DatePickerTheme(
                                        containerHeight: 210.0,
                                      ),
                                      showTitleActions: true,
                                      onConfirm: (time) {
                                        print('confirm $time');
                                        time_end = time;
                                        _end_time =
                                        "${time.hour} : ${time.minute} : ${time
                                            .second}";
                                        setState(() {});
                                      },
                                      currentTime: DateTime.now()
                                      ,
                                      locale: LocaleType.en);
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.access_time,
                                                  size: 18.0,
                                                  color: Color(0xFF002A72),
                                                ),
                                                Text(
                                                  _end_time,
                                                  style: TextStyle(
                                                      color: Color(0xFF002A72),
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "  Change",
                                        style: TextStyle(
                                            color: Color(0xFF002A72),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15),
                      child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: RaisedButton(
                            onPressed: () {
                              var hours = time_end
                                  .difference(time_start)
                                  .inMinutes;
                              showAlertDialog(context);
                            },
                            child: Text(
                                "Save", style: TextStyle(color: Colors.white)),
                            color: new Color(0xFF002A72),
                            elevation: 5,

                          )),
                    )
                  ],
                );
              } else {
                return Container(
                  child: Center(
                    child:
                    SizedBox(
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
            }

        ));
  }
}




