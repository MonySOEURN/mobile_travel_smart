import 'package:flutter/material.dart';
import 'package:travel_smart/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          child: Text("Sign In anon"),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print("Error sign in");
            } else {
              print("Sign in");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
