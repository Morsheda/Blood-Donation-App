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
  List<Marker> donors = [];

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((value) {
      setState(() {
        curLoc = value;
        mapToggle = true;
      });
    });
  }

  Widget loadMarker() {
    return StreamBuilder(
      stream: Firestore.instance.collection('markers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: Text('Loading...'));
        for (int i = 0; i < snapshot.data.documents.length; i++) {
          donors.add(new Marker(
            markerId: MarkerId(i.toString()),
            position: LatLng(snapshot.data.documents[i]['location'].latitude,
                snapshot.data.documents[i]['location'].longitude),
            icon: _markerIcon,
            infoWindow: InfoWindow(
                title: snapshot.data.documents[i]['bg'],
                snippet: snapshot.data.documents[i]['pn']),
          ));
        }
        return GoogleMap(
          markers: Set.from(donors),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(curLoc.latitude, curLoc.longitude), zoom: 15.0),
        );
      },
    );
  }

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
                        ? loadMarker()
                        // GoogleMap(
                        //     markers: Set.from(donors),
                        //     onMapCreated: (GoogleMapController controller) {
                        //       _controller.complete(controller);
                        //     },
                        //     myLocationEnabled: true,
                        //     initialCameraPosition: CameraPosition(
                        //         target:
                        //             LatLng(curLoc.latitude, curLoc.longitude),
                        //         zoom: 20.0),
                        //   )
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
