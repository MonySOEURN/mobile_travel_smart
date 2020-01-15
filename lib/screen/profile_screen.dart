import 'package:flutter/material.dart';
import 'package:travel_smart/screen/place_screen.dart';
import 'package:travel_smart/screen/plan_screen.dart';
import 'package:travel_smart/screen/profile_signed_in_screen.dart';
import 'package:travel_smart/screen/save_place_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: ProfileSignedInScreen())));
  }
}
