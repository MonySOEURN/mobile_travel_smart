import 'package:flutter/material.dart';

class LoginProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      final field = TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
      ),
    );

    final passwordField = TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
      ),
      obscureText: true,
    );

    final emailLabel = Text("E-mail :", style: TextStyle(fontSize: 18,),);
    final passwordLabel = Text("Passwordl :",style: TextStyle(fontSize: 18,),);

    final labelText = Center(
      child: Text(
        'Forget password?',
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
    final loginText = Center(
      child: Text(
        'LOGIN',
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );



    final formWidget = Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          emailLabel,
            SizedBox(
            height: 10,
          ),
          field,
          SizedBox(
            height: 50,
          ),
          passwordLabel,
            SizedBox(
            height: 10,
          ),
          passwordField,
        ],
      ),
    );

    final submitBtn = Center(
        child: RaisedButton(
      color: Colors.green,
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(),
        child: const Text('LOG IN', style: TextStyle(fontSize: 20)),
      ),
    ));

    final body = ListView(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        loginText,
        SizedBox(
          height: 20,
        ),
        formWidget,
        submitBtn,
        SizedBox(
          height: 20,
        ),
        labelText,
      ],
    );
    return Scaffold(
      body: body,
    );
  }
}
