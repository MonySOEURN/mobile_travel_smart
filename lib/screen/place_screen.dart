
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_smart/model/Place.dart';
import 'package:travel_smart/screen/place_detail_screen.dart';

class PlaceScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<PlaceScreen>{
  @override
  Widget build(BuildContext context) {

    final places = [
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
      Place("https://tinyurl.com/yguc9cl9", "Angkor wat", "Siem Reap", 3),
    ];

//    return _buildPlaceList(places);
    return _buildDynamicPlaceList();
//      MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: Scaffold(
//            body: _buildPlaceList(places)
//        )
//    );
  }

  Widget _buildDynamicPlaceList(){
    return StreamBuilder(
      stream: Firestore.instance.collection("places").snapshots(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          print(snapshot.data.documents);
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index){
                return GestureDetector(
                  onTap: (){
                    print(snapshot.data[index]);
                    final route = MaterialPageRoute(
                        builder: (context){
                          return PlaceDetailScreen(snapshot.data[index]);
                        }
                    );
                    Navigator.push(context, route);
                  },
                  child: Container(
                    height: 330,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            snapshot.data[index].placeImage,
                          ),
                        ),
                        Text(snapshot.data[index].placeName, style: TextStyle(fontSize: 20),),
                        Text(snapshot.data[index].placeLocation),
                        Text("${snapshot.data[index].placeRate}")
                      ],
                    ),
                  ),
                );
              }
          );
        } else {
          if(snapshot.hasError){
            print("Error ${snapshot.hasError}");
            return null;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }

  Widget _buildPlaceList(List<Place> places){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: places.length,
      itemBuilder: (BuildContext context, index){
        return GestureDetector(
          onTap: (){
            print(places[index]);
            final route = MaterialPageRoute(
                builder: (context){
                  return PlaceDetailScreen(places[index]);
                }
            );
            Navigator.push(context, route);
          },
          child: Container(
            height: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    places[index].placeImage,
                  ),
                ),
                Text(places[index].placeName, style: TextStyle(fontSize: 20),),
                Text(places[index].placeLocation),
                Text("${places[index].placeRate}")
              ],
            ),
          ),
        );
      }
    );
  }
}