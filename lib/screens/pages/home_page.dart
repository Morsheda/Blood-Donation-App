import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mapToggle = false;
  Position curLoc;
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor _markerIcon;
  //Set<Marker> donors;
  List<Marker> donors = [];

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((value) {
      setState(() {
        curLoc = value;
        mapToggle = true;
        //getMarkers();
        donors.add(
          Marker(
              markerId: MarkerId("1"),
              position: LatLng(23.8759, 90.3795),
              icon: _markerIcon,
              infoWindow: InfoWindow(title: "O+", snippet: "01812257445")),
        );
      });
    });
  }

  // void getMarkers() {
  //   setState(() {
  //     Firestore.instance.collection('markers').getDocuments().then((docs) {
  //       if (docs.documents.isNotEmpty) {
  //         for (int i = 0; i < docs.documents.length; ++i) {
  //           donors.add(Marker(
  //             markerId: MarkerId(i.toString()),
  //             position: LatLng(docs.documents[i].data['location'].latitude,
  //                 docs.documents[i].data['location'].longitude),
  //             draggable: false,
  //             infoWindow: InfoWindow(
  //                 title: docs.documents[i].data['bg'],
  //                 snippet: docs.documents[i].data['pn']),
  //             icon: _markerIcon,
  //           ));
  //         }
  //       }
  //     });
  //   });
  // }

  // Set<Marker> _createMarker() {
  //   return <Marker>[
  //     Marker(
  //         markerId: MarkerId("1"),
  //         position: LatLng(23.48967, 90.24859),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
  //         infoWindow: InfoWindow(title: "O+", snippet: "01812257445")),
  //   ].toSet();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        elevation: 5.0,
        title: Text(
          "Search Donor",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height - 80.0,
                    width: double.infinity,
                    child: mapToggle
                        ? GoogleMap(
                            markers: Set.from(donors), //_createMarker(),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                                target:
                                    LatLng(curLoc.latitude, curLoc.longitude),
                                zoom: 20.0),
                          )
                        : Center(
                            child: Text("Loading...Please wait"),
                          ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
