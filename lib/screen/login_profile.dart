import 'package:flutter/material.dart';

class LoginProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usernameWidget = TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
    );

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

    final passwordWidget = TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
      obscureText: true,
    );

    final formWidget = Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          usernameWidget,
          SizedBox(
            height: 50,
          ),
          passwordWidget,
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
          height: 100,
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
