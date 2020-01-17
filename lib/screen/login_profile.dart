import 'package:flutter/material.dart';
import 'package:travel_smart/screen/register_profile.dart';
import 'package:travel_smart/services/auth.dart';

//class LoginProfile extends StatefulWidget {
//  @override
//  _SignInState createState() => _SignInState();
//}
//
//class _SignInState extends State<LoginProfile> {
//  @override
//  Widget build(BuildContext context) {
//
//    final AuthService _auth = AuthService();
//
//    TextEditingController emailC = TextEditingController();
//    TextEditingController passwordC = TextEditingController();
//
//    final field = TextFormField(
//    controller: emailC,
//      decoration: InputDecoration(
//        fillColor: Colors.grey,
//        border: new OutlineInputBorder(
//          borderSide: new BorderSide(),
//        ),
//      ),
//    );
//
//
//    final passwordField = TextFormField(
//      controller: passwordC,
//      decoration: InputDecoration(
//        fillColor: Colors.grey,
//        border: new OutlineInputBorder(
//          borderSide: new BorderSide(),
//        ),
//      ),
//      obscureText: true,
//    );
//
//    final emailLabel = Text("E-mail :", style: TextStyle(fontSize: 18,),);
//    final passwordLabel = Text("Password :",style: TextStyle(fontSize: 18,),);
//
//    final labelText = Center(
//      child: Text(
//        'Forget password?',
//        style: TextStyle(fontSize: 20, color: Colors.blue),
//      ),
//    );
//    final loginText = Center(
//      child: Text(
//        'Log In',
//        style: TextStyle(fontSize: 30, color: Colors.blue),
//      ),
//    );
//
//
//
//    final formWidget = Padding(
//      padding: EdgeInsets.all(16),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          emailLabel,
//            SizedBox(
//            height: 10,
//          ),
//          field,
//          SizedBox(
//            height: 10,
//          ),
//          passwordLabel,
//            SizedBox(
//            height: 10,
//          ),
//          passwordField,
//        ],
//      ),
//    );
//
//    final submitBtn = Center(
//        child: RaisedButton(
//        color: Colors.green,
//        onPressed: () async {
//
//          print("emailc ${emailC.text}");
//          print("passwordc: ${passwordC.text}");
////          dynamic result = await _auth.signInAnon();
////          if(result == null){
////            print("Error sign in");
////          } else {
////            print("Sign in");
////            print(result.uid);
////          }
//        },
//        textColor: Colors.white,
//        padding: const EdgeInsets.all(5),
//          child: Container(
//            decoration: const BoxDecoration(),
//            child: const Text(
//                 'LOG IN',
//                 style: TextStyle(
//                     fontSize: 20
//                 )
//             ),
//        ),
//    ));
//
//    final body = ListView(
//      children: <Widget>[
//        SizedBox(height: 30,),
//        loginText,
//        SizedBox(height: 20,),
//        formWidget,
//        submitBtn,
//        SizedBox(height: 20,),
//        labelText,
//        SizedBox(height: 15,),
//        Center(
//          child: GestureDetector(
//            onTap: (){
//              print("Sign up");
//              final route = MaterialPageRoute(builder: (context) {
//                return RegisterProfile();
//              });
//              Navigator.push(context, route);
//            },
//            child: Text(
//              "Sign up",
//              style: TextStyle(
//                decoration: TextDecoration.underline
//              ),
//            ),
//          ),
//        ),
//      ],
//    );
//    return Scaffold(
//      body: body,
//    );
//  }
//}

class LoginProfile extends StatefulWidget {
  @override
  _LoginProfileState createState() => _LoginProfileState();
}

class _LoginProfileState extends State<LoginProfile> {

  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Form(
        key: _formkey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget> [
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val){
                    if(val.isEmpty){
                      return 'Enter email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val){
                    if(val.length < 6){
                      return 'Enter password 6+ chars long';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  color: Color(0xFF41C300),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: () async {
//                    print(email);
//                    print(password);
                    if(_formkey.currentState.validate()){
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error = "Could not Sign in with those credentials";
                          });
                          print("invalid email");
                        }
                      }
                  },
                ),
                Text(
                  error,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14),
                ),
                Text(
                  'Forget password?',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      print("Sign up");
                      final route = MaterialPageRoute(builder: (context) {
                        return RegisterProfile();
                      });
                      Navigator.push(context, route);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

