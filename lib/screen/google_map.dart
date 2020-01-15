import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  static const routeName = "/MapWidget";
  final double latitude;
  final double longitude;

  MapWidget(this.latitude, this.longitude);

  @override
  _MapWidgetState createState() => _MapWidgetState();

}

class _MapWidgetState extends State<MapWidget> {

  Completer<GoogleMapController> _controller = Completer();
  static LatLng _center;
  final Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    _center = LatLng(widget.latitude, widget.longitude);
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_center.toString()),
        position: _center,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    return _markers;
  }

  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16.0,
        ),
        mapType: _currentMapType,
        markers: this.myMarker(),
        onCameraMove: _onCameraMove,
      ),
    );
  }
}