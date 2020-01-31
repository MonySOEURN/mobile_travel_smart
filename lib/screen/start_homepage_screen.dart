import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_smart/authenticate/sign_in.dart';
import 'package:travel_smart/authenticate/wrapper.dart';
import 'package:travel_smart/model/user.dart';
import 'package:travel_smart/screen/login_profile.dart';
import 'package:travel_smart/screen/place_screen.dart';
import 'package:travel_smart/screen/plan_screen.dart';
import 'package:travel_smart/screen/profile_screen.dart';
import 'package:travel_smart/screen/register_profile.dart';
import 'package:travel_smart/screen/save_place_screen.dart';
import 'package:travel_smart/services/auth.dart';

import 'forget_password.dart';

class StartHomepageScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}


class _State extends State<StartHomepageScreen>{
  String filterValue = '';
  final menu = ["All","Morning","Afternoon","Evening"];

  @override
  Widget build(BuildContext context) {

    final String filterValue = '';

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
        PopupMenuButton(
            onSelected: _choiceAction,
            icon: Icon(Icons.filter_list),
            itemBuilder: ((BuildContext context){
              return menu.map((item){
                return PopupMenuItem(
                  value: item,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.check_box_outline_blank),
                      SizedBox(width: 5,),
                      Text(item),
                    ],
                  )
                );
              }).toList();
            })
        )
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
                        Tab(icon: Icon(Icons.place), ),
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
                          child: PlaceScreen(this.filterValue),
                        ),
                        Container(
                          child: SavePlaceScreen(),
                        ),
                        Container(
                          child: PlanScreen(),
                        ),
                        Container(
                          child: StreamProvider<User>.value(
                            value: AuthService().user,
                              child: Wrapper()
                          ),
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

  void _choiceAction(String choice){
    switch(choice){
      case "All":{
        filterValue = '';
        setState(() {

        });
        break;
      }
      case "Morning":{
        filterValue = 'Morning';
        setState(() {

        });
        break;
      }
      case "Afternoon":{
        filterValue = 'Afternoon';
        setState(() {

        });
        break;
      }
      default :{
        filterValue = 'Evening';
        print(filterValue);
        setState(() {

        });
      }
    }
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