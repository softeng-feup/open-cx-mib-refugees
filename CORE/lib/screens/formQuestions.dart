import 'package:core/screens/formAnswers.dart';
import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FirstQuestion extends StatefulWidget {
  List<String> answers;

  FirstQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question1();
  }
}

class Question1 extends State<FirstQuestion> {

  List<String> q1_checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
          child: Text(
            "You believe the best solutions come from a safe environment where teammates can share ideas",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 40),
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Text("Strongly disagree"),
              ]),
              Row(children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Text("Disagree"),
              ]),
              Row(children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Text("Don't know"),
              ]),
              Row(children: <Widget>[
                Radio(
                  value: 3,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Text("Agree"),
              ]),
              Row(children: <Widget>[
                Radio(
                  value: 4,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Text("Strongly agree"),
              ]),
            ]))
      ])),
      bottomNavigationBar: Container(
          child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: getButtons(),
      )),
    );
  }

  Widget getButtons() {
    if (widget.answers == null || widget.answers.length == 1) {
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
                if (widget.answers != null) {
                  widget.answers[0] = "$_radioValue";
                  debugPrint(widget.answers.toString());
                  return SecondQuestion(answers: widget.answers);
                } else {
                  List<String> ans;
                  ans = ["$_radioValue"];
                  //debugPrint(ans.toString());
                  return SecondQuestion(answers: ans);
                }
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                if (widget.answers != null) {
                  widget.answers[0] = "$_radioValue";
                  debugPrint(widget.answers.toString());
                  return FormAnswers(answers: widget.answers);
                } else {
                  List<String> ans;
                  ans = ["$_radioValue"];
                  //debugPrint(ans.toString());
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

  SecondQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question2();
  }
}

class Question2 extends State<SecondQuestion> {

  List<String> q2_checked;

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11*2,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
          child: Text(
            "You're always looking for which Javascript framework offers you the best performance",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Don't know"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Agree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly agree"),
                  ]),
                ]))
      ])),
      bottomNavigationBar: Container(
          child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: getButtons(),
      )),
    );
  }

  Widget getButtons() {
    if (widget.answers.length == 1) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FirstQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("$_radioValue");
                return ThirdQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 2) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FirstQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[1] = "$_radioValue";
                return ThirdQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[1] = "$_radioValue";
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

  ThirdQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question3();
  }
}

class Question3 extends State<ThirdQuestion> {

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11*3,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
              child: Text(
                "You protect your info, shop safely, clean up your cache and change passwords frequently",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Don't know"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Agree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly agree"),
                  ]),
                ]))
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {
    if (widget.answers.length == 2) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("$_radioValue");
                return FourthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 3) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[2] = "$_radioValue";
                return FourthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[2] = "$_radioValue";
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

class FourthQuestion extends StatefulWidget {
  List<String> answers;
  bool answered;

  FourthQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question4();
  }
}

class Question4 extends State<FourthQuestion> {

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11*4,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
              child: Text(
                "You believe AI is a wonder of modern science that has made a lot of things possible that were unthinkable before",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Don't know"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Agree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly agree"),
                  ]),
                ]))
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {
    if (widget.answers.length == 3) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ThirdQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("$_radioValue");
                return FifthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 4) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ThirdQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[3] = "$_radioValue";
                return FifthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[3] = "$_radioValue";
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

class FifthQuestion extends StatefulWidget {
  List<String> answers;
  bool answered;

  FifthQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question5();
  }
}

class Question5 extends State<FifthQuestion> {

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11*5,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
              child: Text(
                "Your biggest wish is to have a smart home where IoT devices provide lighting, heating, media and security systems",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Don't know"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Agree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly agree"),
                  ]),
                ]))
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {
    if (widget.answers.length == 4) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FourthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("$_radioValue");
                return SixthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 5) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FourthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[4] = "$_radioValue";
                return SixthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[4] = "$_radioValue";
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

class SixthQuestion extends StatefulWidget {
  List<String> answers;
  bool answered;

  SixthQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question6();
  }
}

class Question6 extends State<SixthQuestion> {

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11*6,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
              child: Text(
                "You know how important it is to provide a positive user experience",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Don't know"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Agree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly agree"),
                  ]),
                ]))
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {
    if (widget.answers.length == 5) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FifthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("$_radioValue");
                return SeventhQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 6) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FifthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[5] = "$_radioValue";
                return SeventhQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[5] = "$_radioValue";
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

class SeventhQuestion extends StatefulWidget {
  List<String> answers;
  bool answered;

  SeventhQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question7();
  }
}

class Question7 extends State<SeventhQuestion> {

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11*7,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
              child: Text(
                "You believe decentralized cryptocurrencies will see increased use from all sectors",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Don't know"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Agree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly agree"),
                  ]),
                ]))
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {
    if (widget.answers.length == 6) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SixthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("$_radioValue");
                return EighthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 7) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SixthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[6] = "$_radioValue";
                return EighthQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[6] = "$_radioValue";
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

class EighthQuestion extends StatefulWidget {
  List<String> answers;
  bool answered;

  EighthQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question8();
  }
}

class Question8 extends State<EighthQuestion> {

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 0.11*8,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
              child: Text(
                "You can't commit to a single operating system environment so virtual machines are a lifesaver",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Disagree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Don't know"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Agree"),
                  ]),
                  Row(children: <Widget>[
                    Radio(
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Strongly agree"),
                  ]),
                ]))
          ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {
    if (widget.answers.length == 7) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SeventhQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("$_radioValue");
                return NinethQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 8) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SeventhQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[7] = "$_radioValue";
                return NinethQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[7] = "$_radioValue";
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

class NinethQuestion extends StatefulWidget {
  List<String> answers;
  bool answered;

  NinethQuestion({Key key, this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Question9();
  }
}

class Question9 extends State<NinethQuestion> {

  List<String> checked;
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
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
          },
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 1000,
                percent: 1,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
              child: Text(
                "Sort the following topics according to your preference",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
    if (widget.answers.length == 8) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EighthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers.add("NOT DONE YET");
                return FormAnswers(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else if (widget.answers.length == 9) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EighthQuestion(
                  answers: widget.answers,
                );
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
                widget.answers[8] = "NOT DONE YET";
                return FormAnswers(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    } else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers(answers: widget.answers);
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
                widget.answers[8] = "NOT DONE YET";
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