import 'package:flutter/material.dart';
import 'package:core/screens/initial.dart';

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
      try {
        // code here
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
        appBar: new AppBar(
          title: new Text('Login'),
        ),
        body: new Container(
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
                ]),
            child: Padding(
              padding: EdgeInsets.all(20.0),
                child: new Form(
                  key: formKey,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Login",
                      style: TextStyle(
                        fontSize: 30,
                      )),
                      new TextFormField(
                        decoration: new InputDecoration(
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 12,
                            ),
                            labelText: 'Email'
                        ),
                        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                        onSaved: (value) => _email = value,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 12,
                            ),
                            labelText: 'Password'
                        ),
                        obscureText: true,
                        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                        onSaved: (value) => _password = value,
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: new RaisedButton(
                          onPressed: () {
                            validateAndSubmit();
                          },
                          child: new Text('Login', style: new TextStyle(color: Colors.white, fontSize: 20)),
                          color: Colors.blue,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "New to CORE? Sign Up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
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
    );
  }
}