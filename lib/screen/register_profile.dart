import 'package:flutter/material.dart';
import 'package:travel_smart/services/auth.dart';

class RegisterProfile extends StatefulWidget {
  @override
  _RegisterProfileState createState() => _RegisterProfileState();
}

class _RegisterProfileState extends State<RegisterProfile> {


  final AuthService _auth = AuthService();

  // text field state
  String password = '';
  String email = '';
  String user_name ='';
  String cornfirm_password ='';
  String error = '';

  final _formkey = GlobalKey<FormState>();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

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

    final passwordField = TextFormField(
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
    );
    final field = TextFormField(
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
    );
  final userName = TextFormField(
    validator: (val){
      if (val.isEmpty) {
        return 'Enter name';
      }
      else {
        return null;
      }
    },
     onChanged: (val){
        setState(() {
          user_name = val;
        });
      },
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
      ),
  );
   final confirmpassword = TextFormField(
    validator: (val){
      if (val != this.password) {
        return 'wrong password';
      }
      else {
        return null;
      }
    },
     onChanged: (val){
        setState(() {
          cornfirm_password = this.password;
        });
      },
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
      ),
      obscureText: true,
  );


    final submitBtn = Center(
        child: RaisedButton(
          color: Color(0xFF41C300),
          onPressed: () async {
//              print(email);
//              print(password);
            if(_formkey.currentState.validate()){
              dynamic result = await _auth.registerWithEmailAndPassword(email, password);
              if(result == null){
                setState(() {
                  error = "please supply valid email";
                });
                print("invalid email");
              }
              Navigator.of(context).pop();
            }
          },
          textColor: Colors.white,
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: const BoxDecoration(),
            child: const Text('SING UP', style: TextStyle(fontSize: 20)),
          ),
    ));

    final formWidget = Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelHeaderText,
            SizedBox(height: 10,),
           userNameLabel,
           SizedBox(
             height: 10,
           ),
           userName,
           SizedBox(
             height: 20,
           ),
            emailLabel,
             SizedBox(
              height: 10,
            ),
            field,
//            SizedBox(
//              height: 20,
//            ),
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
           confirmpassword,
            SizedBox(height: 20,),
            submitBtn,
            SizedBox(height: 20,),
            Text(
              error,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );

    final body = ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),

        formWidget,
//        submitBtn,
       textGmail
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Smart"),
        backgroundColor: Color(0xFF41C300),
      ),
      body: body,
    );
  }
}
