import 'package:core/screens/formQuestions.dart';
import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';
import 'package:starflut/starflut.dart';

class FormAnswers extends StatefulWidget {
  final List<String> answers;

  FormAnswers({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    debugPrint(answers.toString());
    return Answers();
  }
}

class Answers extends State<FormAnswers> {
  Widget getListView() {
    var listItems = widget.answers;

    var listView = ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.keyboard_arrow_right),
              title: Text("Question ${index + 1}"),
              subtitle: Text(listItems[index]),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  switch (index) {
                    case 0:
                      return FirstQuestion(answers: widget.answers);
                    case 1:
                      return SecondQuestion(answers: widget.answers);
                    case 2:
                      return ThirdQuestion(answers: widget.answers);
                    default:
                      return FormAnswers(answers: widget.answers);
                  }
                }));
              });
        });
    return listView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('CORE'),
            backgroundColor: new Color(0xFF002A72),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StartForm();
                  }));
                })),
        body: Container(
            child: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: getListView(),
        )

            /*Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 40, right: 40, top: 30, bottom: 30),
                  child: Text(
                    widget.val1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 30),
                child: Text(
                  widget.val2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 30),
                child: Text(
                  widget.val3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),*/
            ),
        bottomNavigationBar: Container(
            child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StartForm();
                  }));
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: new Color(0xFF002A72)),
                ),
                color: Colors.white,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                color: new Color(0xFF002A72),
              )
            ],
          ),
        )));
  }
}
