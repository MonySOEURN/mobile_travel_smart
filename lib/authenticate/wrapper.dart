import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_smart/authenticate/sign_in.dart';
import 'package:travel_smart/model/user.dart';
import 'package:travel_smart/screen/login_profile.dart';
import 'package:travel_smart/screen/profile_signed_in_screen.dart';

class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    if(user == null){
      return LoginProfile();
    } else {
      return ProfileSignedInScreen();
    }
  }
}
