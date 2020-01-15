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

    final textGmail = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Image( image: AssetImage('assets/gmail.jpg'),height: 120.0,
              width: 80.0 ),
        const Text( 'Sign Up with Gmail?',
        style: TextStyle(fontSize: 20, color: Colors.blue),),

      ],
    );
    
    final userNameLabel = Text("User Name :", style: TextStyle(fontSize: 18,),);
    final emailLabel = Text("E-mail :",style: TextStyle(fontSize: 18,),);
    final passwordLabel = Text("Password :",style: TextStyle(fontSize: 18,),);
    final confirmPassLabel = Text("Cornfirm password :",style: TextStyle(fontSize: 18,),);

    final passwordField = TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
      ),
      obscureText: true,
    );
    final field = TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
      ),
    );

    final formWidget = Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          labelHeaderText,
          SizedBox(height: 10,),
          userNameLabel,
          SizedBox(
            height: 10,
          ),
          field,
          SizedBox(
            height: 20,
          ),
          emailLabel,
           SizedBox(
            height: 10,
          ),
          field,
          SizedBox(
            height: 20,
          ),
          passwordLabel,
           SizedBox(
            height: 10,
          ),
          passwordField,
          SizedBox(
            height: 20,
          ),
          confirmPassLabel,
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
        child: const Text('SING UP', style: TextStyle(fontSize: 20)),
      ),
    ));

    final body = ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
      
        formWidget,
        submitBtn,
       textGmail
      ],
    );
    return Scaffold(
      body: body,
    );
  }
}
