import 'package:flutter/material.dart';
import 'dart:io';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(
    Login(),
  );
}

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{
  final formkey = GlobalKey<FormState>();
  bool setStyle = true;
  bool enabled = true;
  String username = '';
  String password = '';
  int loginFail = 0;
  int attempt = 3;
  String output = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login",
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(title: Text("18IT099",),),
            body: Container(
              margin: EdgeInsets.all(10.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1.0)
                            )
                        ),
                        onChanged: (value) => username = value,
                        validator: RequiredValidator(errorText: 'REQUIRED!'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: "password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1.0)
                            )
                        ),
                        onChanged: (value) => password = value,
                        validator: RequiredValidator(errorText: 'REQUIRED!'),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: enabled ? () => validate() : null,
                          child: Text("Login"),
                        ),
                        RaisedButton(
                          onPressed: () => exit(0),
                          child: Text("cancel"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Attempts left: ' + attempt.toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        output,
                        style: setStyle ?
                        TextStyle(
                          backgroundColor: Colors.green,
                          fontSize: 25.0,
                        ):
                        TextStyle(
                          backgroundColor: Colors.red,
                          fontSize: 25.0,
                        ),
                      ),
                    )


                  ],
                ),
              ),
            )
        )
    );

  }
  void validate() {
    if (formkey.currentState.validate()) {
      print('validated');
      login();
    }
  }

  login() {
    setState(() {

    });

    if (username == '18IT099' && password == 'ritik') {
      output = 'Login Successful';
      setStyle = true;
      print("Sucessful");
    }

    else {
      setStyle = false;
      loginFail++;
      attempt--;
      output = 'Invalid Credentials';
      if(loginFail == 3){
        enabled = false;
      }
      print(loginFail);
    }
  }
}