import 'package:core/screens/formAnswers.dart';
import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class FirstQuestion extends StatefulWidget {

  List<String> answers;

  FirstQuestion({Key key, this.answers}) : super (key:key);

  @override
  State<StatefulWidget> createState() {

    return Question1();
  }
}

class Question1 extends State<FirstQuestion> {
  @override
  List<String> q1_checked;


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        title: Text('CORE'),
        backgroundColor: new Color(0xFF002A72),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return StartForm();
            }));
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding:
              EdgeInsets.only(left: 40, right: 40, top: 80, bottom: 30),
              child: Text(
                "Choose the three that interest you the most",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: CheckboxGroup(
                labels: <String>[
                  "Web Development",
                  "App Development",
                  "Security",
                  "Automation",
                  "Data Science",
                ],
                onSelected: (List<String> checked) {
                  q1_checked = checked;
                  print(q1_checked.toString());
                },),
            ),
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),);
  }

  Widget getButtons() {

    if(widget.answers == null || widget.answers.length==1) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StartForm();
              }));
            },
            child: Text(
              "Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                if(widget.answers != null) {
                  if(q1_checked == null || q1_checked.isEmpty) {
                    widget.answers[0] = "Not answered";
                  }
                  else {
                    widget.answers[0] = q1_checked.toString();
                  }
                  return SecondQuestion(answers: widget.answers);
                }
                else {
                  List<String> ans;
                  if(q1_checked == null || q1_checked.isEmpty) {
                    ans = ["Not answered"];
                  }
                  else {
                    ans = [q1_checked.toString()];
                  }

                  return SecondQuestion(answers: ans);
                }

              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }
    else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers();
              }));
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                if(widget.answers != null) {
                  if(q1_checked == null || q1_checked.isEmpty) {
                    widget.answers[0] = "Not answered";
                  }
                  else {
                    widget.answers[0] = q1_checked.toString();
                  }
                  return FormAnswers(answers: widget.answers);
                }
                else {
                  List<String> ans;
                  if(q1_checked == null || q1_checked.isEmpty) {
                    ans = ["Not answered"];
                  }
                  else {
                    ans = [q1_checked.toString()];
                  }

                  return FormAnswers(answers: ans);
                }

              }));
            },
            child: Text("Resubmit", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }


  }

}




class SecondQuestion extends StatefulWidget {

  List<String> answers;
  bool answered;

  SecondQuestion({Key key, this.answers}) : super (key:key);

  @override
  State<StatefulWidget> createState() {
    debugPrint(answers.toString());
    return Question2();
  }
}

class Question2 extends State<SecondQuestion> {
  @override
  List<String> q2_checked;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        title: Text('CORE'),
        backgroundColor: new Color(0xFF002A72),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return StartForm();
            }));
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding:
              EdgeInsets.only(left: 40, right: 40, top: 80, bottom: 30),
              child: Text(
                "Choose your area of education",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: CheckboxGroup(
                labels: <String>[
                  "Engineering",
                  "Technical",
                  "Sales",
                  "Automation",
                  "Data Science",
                ],
                onSelected: (List<String> checked) {
                  q2_checked = checked;
                  print(q2_checked.toString());
                },
              ),
            ),
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {

    if(widget.answers.length==1) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return FirstQuestion(answers: widget.answers,);
              }));
            },
            child: Text(
              "Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                if (q2_checked == null || q2_checked.isEmpty) {
                  widget.answers.add("Not answered");
                }
                else {
                  widget.answers.add(q2_checked.toString());
                }
                return ThirdQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }
    else if (widget.answers.length==2) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return FirstQuestion(answers: widget.answers,);
              }));
            },
            child: Text(
              "Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                if (q2_checked == null || q2_checked.isEmpty) {
                  widget.answers[1] = "Not answered";
                }
                else {
                  widget.answers[1] = q2_checked.toString();
                }
                return ThirdQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }
    else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers();
              }));
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                if(q2_checked == null || q2_checked.isEmpty) {
                  widget.answers[1] = "Not answered";
                }
                else {
                  widget.answers[1] = q2_checked.toString();
                }
                return FormAnswers(answers: widget.answers);

              }));
            },
            child: Text("Resubmit", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }

  }

}




class ThirdQuestion extends StatefulWidget {

  List<String> answers;
  bool answered;

  ThirdQuestion({Key key, this.answers}) : super (key:key);

  @override
  State<StatefulWidget> createState() {

    return Question3();
  }
}

class Question3 extends State<ThirdQuestion> {
  @override
  String q3_txt;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(title: Text('CORE'), backgroundColor: new Color(0xFF002A72)),
      body: Container(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 80, bottom: 30),
                child: Text(
                  "Write some text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
                child: TextField(
                    onSubmitted: (String userInput) { //onSubmitted o texto muda quando clicamos ok
                      setState(() {
                        q3_txt = userInput;
                        debugPrint(q3_txt);
                      });
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Some text',
                        hintText: 'e.g. blablabla',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
              ),
            ]),
          )),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {

    if(widget.answers.length==2) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondQuestion(answers: widget.answers,);
              }));
            },
            child: Text(
              "Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                if(q3_txt == null || q3_txt.isEmpty) {
                  widget.answers.add("Not answered");
                }
                else {
                  widget.answers.add(q3_txt);
                }
                return FormAnswers(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }
    else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers();
              }));
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                if(q3_txt == null || q3_txt.isEmpty) {
                  widget.answers[2]="Not answered";
                }
                else {
                  widget.answers[2]=q3_txt;
                }
                return FormAnswers(answers: widget.answers);

              }));
            },
            child: Text("Resubmit", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }

  }

}
