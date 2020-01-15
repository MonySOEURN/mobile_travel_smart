import 'package:flutter/material.dart';
import 'package:travel_smart/screen/login_profile.dart';
import 'package:travel_smart/screen/place_screen.dart';
import 'package:travel_smart/screen/plan_screen.dart';
import 'package:travel_smart/screen/profile_screen.dart';
import 'package:travel_smart/screen/register_profile.dart';
import 'package:travel_smart/screen/save_place_screen.dart';

import 'forget_password.dart';

class StartHomepageScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}


class _State extends State<StartHomepageScreen>{

  @override
  Widget build(BuildContext context) {

    final searchIcon = _buildAppBarIcons(Icon(Icons.search), (){
      print("press search");
    });
    final filterIcon = _buildAppBarIcons(Icon(Icons.filter_list), (){
      print("Press filter");
    });

    final appBar = AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Color(0xFF41C300),
      title: Text("Travel Smart", style: TextStyle(color: Colors.black),),
      actions: <Widget>[
        searchIcon,
        filterIcon
      ],
    );

    return MaterialApp(
      home: Scaffold(
          appBar: appBar,
          body: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                Container(
//                  constraints: BoxConstraints.expand(height: 50),
                  child: new Material(

//                    color: Colors.black,
                    child: new TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(icon: Icon(Icons.place),),
                        Tab(icon: Icon(Icons.save_alt),),
                        Tab(icon: Icon(Icons.directions),),
                        Tab(icon: Icon(Icons.account_circle),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TabBarView(children: [
                        Container(
                          child: PlaceScreen(),
                        ),
                        Container(
                          child: SavePlaceScreen(),
                        ),
                        Container(
                          child: PlanScreen(),
                        ),
                        Container(
                          child: ForgetPassword(),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildAppBarIcons(Icon icon, Function press){
    return GestureDetector(
      onTap: press,
      child: IconButton(
        icon: icon,
        onPressed: press,
      ),
    );
  }


  Widget _buildTabBar(String text, Icon icon){
    return Tab(
      child: Container(
        decoration: BoxDecoration(
//          color: Colors.redAccent,
//          border: Border.all(color: Colors.redAccent, width: 1)
        ),
          child: Align(
            alignment: Alignment.center,
              child: Text(text),
          )
    ),
    );
  }

}