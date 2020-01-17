import 'package:flutter/material.dart';
import 'package:travel_smart/screen/google_map.dart';

class PlanMapScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Smart"),
        backgroundColor: Color(0xFF41C300),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
    //                  constraints: BoxConstraints.expand(height: 50),
                child: new Material(

    //                    color: Colors.black,
                  child: new TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "Place Map",),
                      Tab(text: "Place List",),
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
                        height: 500,
                        width: 500,
                        child: MapSample(),
                      ),
                      Container(
                        child: _buildAddedPlaceListWidget(),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildMapWidget(){
    return Center(
      child: Container(
        height: 500,
        width: 500,
//        child: MapSample(),
      )
    );
  }

  Widget _buildAddedPlaceListWidget(){
    return Center(
      child: Text("Places list"),
    );
  }

}