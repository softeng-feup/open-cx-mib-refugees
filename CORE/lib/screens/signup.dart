import 'package:core/screens/login.dart';
import 'package:core/screens/initial.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> newUser(String fullname, String email, String password) async {
  String url = 'http://10.0.2.2:5000/users/register';

  final response = await http.post(url,
        headers: {
          "Accept": "application/json"
        },
        body:
        {'fullname': fullname,
          'password': password,
          'email': email
        }
      );

  return response.body;

}

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String _fullname;
  String _email;
  String _password;
  String _confirmed_password;

  final GlobalKey<ScaffoldState> _buttonkey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit(String this_fullname, String this_email,  String this_password, String this_confirmed_password) async {
    if (this_fullname.length >= 6) {
      if (this_password == this_confirmed_password) {
        try {
          Future<String>response = newUser(
              this_fullname, this_email, this_password);
          if (await response == 'User registered successfully') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Initial()),
            );
          } else if (await response == 'Email already exists') {
            print('Email already exists');
          }

        }
        catch (e) {
          print('Erros: $e');
        }
      } else {
        print('Passwords don\'t match');
      }
    } else {
      print('Fullname must have at leat 6 characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text('Sign Up'),
        ),
        body: Stack(
          children: <Widget>[
            Center(
                child: new Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    margin: EdgeInsets.all(50.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color:  Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: new Form(
                          key: formKey,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: new TextFormField(
                                  decoration: new InputDecoration(
                                      contentPadding: const EdgeInsets.all(12.0),
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(
                                        ),
                                      ),
                                      hintText: 'Enter your fullname',
                                      hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12,
                                      ),
                                      labelText: 'Fullname'
                                  ),
                                  //validator: (value) => value.isEmpty ? 'Fullname can\'t be empty' : null,
                                  onSaved: (value) => _fullname = value,
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: new TextFormField(
                                  decoration: new InputDecoration(
                                      contentPadding: const EdgeInsets.all(12.0),
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(
                                        ),
                                      ),
                                      hintText: 'Enter your email',
                                      hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12,
                                      ),
                                      labelText: 'Email'
                                  ),
                                  //validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                                  onSaved: (value) => _email = value,
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: new TextFormField(
                                  decoration: new InputDecoration(
                                    contentPadding: const EdgeInsets.all(12.0),
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12,
                                    ),
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                  //validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                                  onSaved: (value) => _password = value,
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: new TextFormField(
                                  decoration: new InputDecoration(
                                    contentPadding: const EdgeInsets.all(12.0),
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    hintText: 'Confirm your password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12,
                                    ),
                                    labelText: 'Confirmed Password',
                                  ),
                                  obscureText: true,
                                  //validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                                  onSaved: (value) => _confirmed_password = value,
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: new RaisedButton(
                                  key: _buttonkey,
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  onPressed: () {
                                    if (validateAndSave()) {
                                      validateAndSubmit(_fullname, _email, _password, _confirmed_password);
                                    }
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                                  child: new Text('Sign Up', style: new TextStyle(color: Colors.white, fontSize: 20)),
                                  color: new Color(0xFF002A72),
                                ),
                              ),
                              new Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginPage()),
                                          );
                                        },
                                        child: new Padding(
                                          padding: new EdgeInsets.all(10.0),
                                          child: new Text("Sign in instead"),
                                        ),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                    )
                )
            ),
            Container(
              alignment: Alignment(0.0, -1.0),
              child: Image.asset(
                "images/core.png",
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            )
          ],
        )
    );
  }
}