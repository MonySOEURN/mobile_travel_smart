import 'package:flutter/material.dart';
import 'package:travel_smart/model/Place.dart';


class PlaceDetailScreen extends StatefulWidget{

  final Place place;

  PlaceDetailScreen(this.place);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<PlaceDetailScreen> {

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      title: Text(widget.place.placeName),
      backgroundColor: Color(0xFF41C300),
    );

    // TODO: implement build
    return Scaffold(
        appBar: appBar,
        body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget(){

    // place photo and name
    final placeInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.place.placeName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(widget.place.placeLocation),
        Text("${widget.place.placeRate}"),
      ],
    );

    // component for save button
    final saveButton = Center(
      child: Row(
        children: <Widget>[
          RaisedButton.icon(
            onPressed: null,
            icon: Icon(
              Icons.flag,
              color: Colors.black,
            ),
            label: Text(
              "Save Place",
              style: TextStyle(
                color: Colors.black
              ),
            )
          ),
        ],
      ),
    );

    // description variable
    final description = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Description: ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),
        ),
        SizedBox(height: 5,),
        Text(
            "Description Text area"
        )
      ],
    );

    // place time and scription detail
    final placeTime = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTimeList("Time: ", "Open (8:00 AM - 5:00 PM)"),
        _buildTimeList("Suggest Time: ", "(9:00 AM , 2:00 PM)"),
        _buildTimeList("Time should spend: ", " 1 hour "),
        SizedBox(height: 15,),
      ],
    );

    // column between place info. Vs Time
    final infoandTime = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        placeInfo,
        SizedBox(height: 15,),
        placeTime
      ],
    );

    // row between place info., time detail Vs save button
    final infoandButton = Row(
      children: <Widget>[
        infoandTime,
        Spacer(),
        saveButton,
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          SizedBox(height: 4,),
          Image.network(widget.place.placeImage),
          infoandButton,
          description,
        ],
      ),
    );
  }

  Widget _buildTimeList(String key, String value){
    print(widget.place.placeImage);
    return Row(
      children: <Widget>[
        Text(key),
        Text(
          value,
          style: TextStyle(
              fontSize: 10,
              color: Colors.lightBlue
          ),
        )
      ],
    );
  }

}