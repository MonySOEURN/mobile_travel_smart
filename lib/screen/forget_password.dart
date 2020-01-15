import 'package:flutter/material.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword();

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

    final emailLabel = Text("E-mail :", style: TextStyle(fontSize: 18,),);


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
        ],
      ),
    );
     final loginText = Center(
      child: Text(
        'Forgot password',
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );

    final loginLabel = Center(
      child: Text(
        'LOGIN ?',
        style: TextStyle(fontSize: 18, color: Colors.blue),
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
        child: const Text('Reset password', style: TextStyle(fontSize: 20)),
      ),
    ));







     final body = ListView(
      children: <Widget>[
        SizedBox(
          height: 80,
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
        loginLabel
      ],
    );
    return Scaffold(
      body: body,
    );
  }
}
