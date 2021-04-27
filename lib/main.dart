import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class LoginData {
  String name = "";
  String username = "";
  String password = "";
  String address = "";
  String tel = "";
}

class _MyApp extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message) {
    try {
      // ignore: deprecated_member_use
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Back',
          onPressed: () {
            // some code
            print('Action in Snackbar has been pressed.');
          },
        ),
      ));
    } on Exception catch (e, str) {
      print(str);
    }
  }

  @override
  Widget build(BuildContext inContext) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: Scaffold(
            key: _scaffoldKey,
            body: Container(
                padding: EdgeInsets.all(50.0),
                child: Form(
                    key: this._formKey,
                    child: Column(children: [
                      TextFormField(
                          onSaved: (String inValue) {
                            this._loginData.name = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Name", labelText: "Your Name")),
                      TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter Address";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.address = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Your Address", labelText: "Address")),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter Tel";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.tel = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Your Telephon Number",
                              labelText: "Phone Number")),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter Email";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.username = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "non@email.com",
                              labelText: "eMail address")),
                      TextFormField(
                          obscureText: true,
                          validator: (String inValue) {
                            if (inValue.length < 10) {
                              return "Password must be >=10 in length";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.password = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Password", labelText: "Password")),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Colors.lightBlue,
                        child: Text("Log In"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            _showMessageInScaffold(
                                "Welcome to , ${_loginData.name}, ${_loginData.address}, ${_loginData.tel}, ${_loginData.username}");
                            print("Welcome to , ");
                            print("Name: ${_loginData.name}");
                            print("Address: ${_loginData.address}");
                            print("Tel.: ${_loginData.tel}");
                            print("Username: ${_loginData.username}");
                            print("Password: ${_loginData.password}");
                          }
                        },
                      )
                    ])))));
  }
}
