import 'package:flutter/material.dart';
import 'package:travel_smart/screen/place_screen.dart';
import 'package:travel_smart/screen/plan_screen.dart';
import 'package:travel_smart/screen/register_profile.dart';
// import 'package:travel_smart/screen/profile_screen.dart';
import 'package:travel_smart/screen/save_place_screen.dart';

import 'login_profile.dart';

class StartHomepageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

//enum Answer {YES, NO, MAYBE}

class _State extends State<StartHomepageScreen> {
//  String _answer = "";
//
//  void setAnswer(String value){
//    setState(() {
//      // To Do Action on Value
//      _answer = value;
//    });
//  }
//
//  Future<Null> _askUser() async {
//    switch(
//      await showDialog(
//        context: context,
//        child: SimpleDialog(
//          title: Text("Do you like flutter?"),
//          children: <Widget>[
//            SimpleDialogOption(
//              onPressed:  (){
//                Navigator.pop(context, Answer.YES);
//              },
//              child: Text("YES!!!!"),
//            ),
//            SimpleDialogOption(
//              onPressed:  (){
//                Navigator.pop(context, Answer.NO);
//              },
//              child: Text("NO!!!!"),
//            ),
//            SimpleDialogOption(
//              onPressed:  (){
//                Navigator.pop(context, Answer.MAYBE);
//              },
//              child: Text("MAYBE!!!!"),
//            )
//          ],
//        )
//      )
//    ){
//      case Answer.YES:
//        setAnswer("Yes");
//        break;
//      case Answer.NO:
//        setAnswer("No");
//        break;
//      case Answer.MAYBE:
//        setAnswer("Maybe");
//        break;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final searchIcon = _buildAppBarIcons(Icon(Icons.search), () {
      print("press search");
    });
    final filterIcon = _buildAppBarIcons(Icon(Icons.filter_list), () {
      print("Press filter");
      return DropdownButton(
        items: [
//          DropdownMenuItem(
//            child: ListTile(
//              title: Icon(Icons.flag),
//              subtitle: Text("Item 1"),
//            ),
//          ),
//          DropdownMenuItem(
//            child: ListTile(
//              title: Icon(Icons.flag),
//              subtitle: Text("Item 1"),
//            ),
//          ),
        ],
      );
    });

    final appBar = AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Color(0xFF41C300),
      title: Text(
        "Travel Smart",
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[searchIcon, filterIcon],
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
                      Tab(
                        icon: Icon(Icons.place),
                      ),
                      Tab(
                        icon: Icon(Icons.save_alt),
                      ),
                      Tab(
                        icon: Icon(Icons.directions),
                      ),
                      Tab(
                        icon: Icon(Icons.account_circle),
                      ),
                    ],
                  ),
                ),
              ),
//                Text('You have answer ${_answer}'),
//                RaisedButton(
//                  child: Text("Click me"),
//                  onPressed: (){
//                    print("Click me");
////                    _askUser();
//                    showDialog(
//                        context: context,
//                        builder: (BuildContext context){
//                          return AlertDialog(
//                            title: Text("Hello"),
//                            content: Text("What up"),
//                          );
//                    });
//                }),
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
                        child: RegisterProfile(),
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

  Widget _buildAppBarIcons(Icon icon, Function press) {
    return GestureDetector(
      onTap: press,
      child: IconButton(
        icon: icon,
        onPressed: press,
      ),
    );
  }

  Widget _buildFilterDialog() {
    return SimpleDialog(
      title: const Text("Filter Options: "),
      children: <Widget>[
        _buildDialogElement("All"),
        _buildDialogElement("Morning"),
        _buildDialogElement("Afternoon"),
        _buildDialogElement("Evening"),
      ],
    );
  }

  Widget _buildDialogElement(String key) {
    return SimpleDialogOption(
      child: Text(key),
      onPressed: () {
        print("Key $key");
      },
    );
  }

  Widget _buildTabBar(String text, Icon icon) {
    return Tab(
      child: Container(
          decoration: BoxDecoration(
//          color: Colors.redAccent,
//          border: Border.all(color: Colors.redAccent, width: 1)
              ),
          child: Align(
            alignment: Alignment.center,
            child: Text(text),
          )),
    );
  }
}
