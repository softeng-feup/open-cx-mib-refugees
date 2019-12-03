import 'package:flutter/material.dart';
import 'package:core/screens/initial.dart';
import 'package:core/screens/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try { // code here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Initial()),
        );
        print('Signed in');
      }
      catch(e) {
        print('Erros: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text('Login'),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: new Container(
                  height: MediaQuery.of(context).size.height / 2.2,
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
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12,
                                    ),
                                    labelText: 'Email'
                                ),
                                validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
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
                                validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                                onSaved: (value) => _password = value,
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.only(top: 15.0),
                              child: new RaisedButton(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                onPressed: () {
                                  validateAndSubmit();
                                },
                                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                                child: new Text('Login', style: new TextStyle(color: Colors.white, fontSize: 20)),
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
                                    MaterialPageRoute(builder: (context) => SignUpPage()),
                                  );
                            },
                              child: new Padding(
                                padding: new EdgeInsets.all(10.0),
                                child: new Text("New to CORE? Sign Up"),
                              ),
                                    //Text(
                                      //"New to CORE? Sign Up",
                                      //style: TextStyle(
                                        //color: new Color(0xFF002A72),
                                        //fontSize: 12,
                                      //),

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
                width: MediaQuery.of(context).size.width / 1.2,
              ),
            )
          ],
        )
    );
  }
}