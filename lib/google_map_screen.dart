import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
   MapPage({Key? key, required this.latitute, required this.longtute}) : super(key: key);
final double latitute;
final double longtute;
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.latitute,widget.longtute ),
        zoom: 10,
      ),
      markers: {

        Marker(
          markerId: MarkerId("source location"),
          position: LatLng(widget.latitute,widget.longtute ),
        ),
      },
    );
  }
}
