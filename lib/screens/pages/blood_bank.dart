import 'dart:convert';
import 'package:flutter/material.dart';

class BloodBanks extends StatefulWidget {
  @override
  _BloodBanksState createState() => _BloodBanksState();
}

class _BloodBanksState extends State<BloodBanks> {
  @override
  Widget build(BuildContext context) {
    Future<List<Widget>> createList() async {
      List<Widget> items = new List<Widget>();
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        items.add(Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 5.0),
                  ]),
              margin: EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(object["placeName"]),
                    Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: Text(
                          "Location: ${object["address"]}",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        )),
                    Text(
                      "Contact info: ${object["pnum"]}",
                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                    )
                  ],
                ),
              ),
            )));
      });

      return items;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        elevation: 5.0,
        title: Text(
          "List of Blood Banks",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white24,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _searchBar(context),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Dhaka Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Chittagong Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Mymensingh Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Rajshahi Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Rangpur Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Sylhet Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Khulna Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Barishal Division',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                ),
              ),
              Container(
                child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _searchBar(BuildContext contex) {
  return Container(
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey[300],
        )),
    child: TextField(
      //onChanged: (v) => ,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.search),
        hintText: 'Search...',
        hintStyle:
            TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
      ),
    ),
  );
}
