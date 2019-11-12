import 'package:core/screens/formQuestions.dart';
import 'package:core/screens/startForm.dart';
import 'package:core/screens/rankings.dart';
import 'package:flutter/material.dart';

class FormAnswers extends StatefulWidget {
  final List<String> answers;

  FormAnswers({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Answers();
  }
}

class Answers extends State<FormAnswers> {


  Widget getAnswer(String number) {

    String text;

    switch (number) {
      case "-1":
        text = "NOT ANSWERED";
        break;
      case "0":
        text = "Strongly disagree";
        break;
      case "1":
        text = "Disagree";
        break;
      case "2":
        text = "Don't know";
        break;
      case "3":
        text = "Agree";
        break;
      case "4":
        text = "Strongly agree";
        break;
      default:
        text = number;
        break;
    }

    return Text(text);
  }

  Widget getListView() {
    var listItems = widget.answers;

    var listView = ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.keyboard_arrow_right),
              title: Text("Question ${index + 1}"),
              subtitle: getAnswer(listItems[index]),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  switch (index) {
                    case 0:
                      return FirstQuestion(answers: widget.answers);
                    case 1:
                      return SecondQuestion(answers: widget.answers);
                    case 2:
                      return ThirdQuestion(answers: widget.answers);
                    case 3:
                      return FourthQuestion(answers: widget.answers);
                    case 4:
                      return FifthQuestion(answers: widget.answers);
                    case 5:
                      return SixthQuestion(answers: widget.answers);
                    case 6:
                      return SeventhQuestion(answers: widget.answers);
                    case 7:
                      return EighthQuestion(answers: widget.answers);
                    case 8:
                      return NinethQuestion(answers: widget.answers);
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Rankings();
                  }));
                },
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                color: new Color(0xFF002A72),
              )
            ],
          ),
        )));
  }
}
