import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_smart/model/Place.dart';
//import '';

class SavePlaceScreen extends StatefulWidget {
  @override
  _SavePlaceScreenState createState() => _SavePlaceScreenState();
}

class _SavePlaceScreenState extends State<SavePlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: _buildSavePlaceList()
        )
    );
  }
  
  Widget _defaultWidge(){
    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'There is No Save Place!.',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            SizedBox(
              width: 350,
              child: RaisedButton(
                  color: Color(0xff41c300),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //                            Icon(Icons.plus_one),
                      const Text('Go to place',
                          style: TextStyle(fontSize: 14)),
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
    );
  }

  Widget _checkitSavePlaceExist(){
//    return Firestore.instance.collection("save_place").getDocuments();
  }

  Widget _buildSavePlaceList(){
    return  StreamBuilder(
      stream: Firestore.instance.collection("save_place").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Load data error.'),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print("done");
            return _buildPlacesListWidget(snapshot.data);
          }
        }
      },
    );

  }

  Widget _buildPlacesListWidget(QuerySnapshot data) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: data.documents.map((document){
        final id = document["id"];
        final placeName = document["placeName"];
        final placeImage = document["placeImage"];
        final placeLocation = document["placeLocation"];
        final int placeRate = document["placeRate"];
        Place place = Place(placeImage, placeName, placeLocation, placeRate);
        return Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){

                print(document['id']);
//                final route = MaterialPageRoute(
//                    builder: (context){
//                      return PlaceDetailScreen(place);
//                    }
//                );
//                Navigator.push(context, route);
              },
              child: Container(
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        document["placeImage"],
//                    height: 260,
//                    width: 270,
                      ),
                    ),
                    Text(document["placeName"], style: TextStyle(fontSize: 20),),
                    Text(document["placeLocation"]),
                    Text("${document["placeRate"]}")
                  ],
                ),
              ),
            )
          ],
        );
      }).toList(),
    );
  }


}
