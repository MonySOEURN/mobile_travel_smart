import 'package:flutter/material.dart';

class RegisterProfile extends StatelessWidget {
  const RegisterProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelHeaderText = Center(
      child: Text(
        'Create an account',
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );

    final userName = TextField(
      decoration: InputDecoration(
        labelText: 'User name',
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
    );

    final email = TextField(
      decoration: InputDecoration(
        labelText: 'E-mail',
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
      obscureText: true,
    );

    final password = TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: new BorderSide(),
        ),
      ),
      obscureText: true,
    );
    final confirmPassword = TextField(
      decoration: InputDecoration(
        labelText: 'Cornfirm password',
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
          labelHeaderText,
          SizedBox(
            height: 20,
          ),
          userName,
          SizedBox(
            height: 20,
          ),
          email,
          SizedBox(
            height: 20,
          ),
          password,
          SizedBox(
            height: 20,
          ),
          confirmPassword
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
        child: const Text('SING UP', style: TextStyle(fontSize: 20)),
      ),
    ));

    final body = ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        formWidget,
        submitBtn,
        SizedBox(
          height: 20,
        ),
      ],
    );
    return Scaffold(
      body: body,
    );
  }
}
