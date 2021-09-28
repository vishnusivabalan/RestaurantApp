
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
 const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map Screen"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(22.5448131, 88.3403691),
          zoom: 15,
        ),
      ),
    );
  }
}
