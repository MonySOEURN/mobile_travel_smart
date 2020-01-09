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
    return Column(
      children: <Widget>[
        Image.network(widget.place.placeImage),
        Text(widget.place.placeName),
        Text(widget.place.placeLocation),
        Text("${widget.place.placeRate}"),
      ],
    );
  }

}