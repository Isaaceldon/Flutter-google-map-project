import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
static const cotonou = LatLng(6.3724685, 2.3261369);
static const paris = LatLng(48.866667, 2.333333);

Marker _cotonouMarker = Marker(
  markerId: const MarkerId("cotonou"),
  infoWindow: const InfoWindow(title: 'Cotonou'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  position: cotonou,);

Marker _parisMarker = Marker(
  markerId: const MarkerId("paris"),
  infoWindow: const InfoWindow(title: 'Paris'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  position: paris,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(

        children: [
          Expanded(
              child: GoogleMap(
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                markers: {
                  _cotonouMarker,
                  _parisMarker
                },

                initialCameraPosition: CameraPosition(
                  target: paris,
                  zoom: 17
                ),

                onMapCreated: (GoogleMapController controller){

                },
              )
          )
        ],
      ),
    );
  }
}
