import 'package:blood_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool vals = true;
  String msgs = "Available";
  bool valn = true;
  String msgn = "On";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        elevation: 5.0,
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(fontSize: 18),
                      ),
                      new Text(
                        msgs,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Switch(
                  value: vals,
                  onChanged: (bool e) => toglS(e),
                  activeColor: Colors.teal[400],
                  inactiveTrackColor: Colors.grey[400],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notification",
                        style: TextStyle(fontSize: 18),
                      ),
                      new Text(
                        msgn,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Switch(
                  value: valn,
                  onChanged: (bool e) => toglN(e),
                  activeColor: Colors.teal[400],
                  inactiveTrackColor: Colors.grey[400],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Change your personal information",
                style: TextStyle(fontSize: 18),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Icon(Icons.edit),
              )
            ]),
          ]),
        ),
      ),
    );
  }

  void toglS(bool e) {
    setState(() {
      if (e) {
        msgs = "Available";
        vals = true;
      } else {
        msgs = "Unavailable";
        vals = false;
      }
    });
  }

  void toglN(bool e) {
    setState(() {
      if (e) {
        msgn = "On";
        valn = true;
      } else {
        msgn = "Off";
        valn = false;
      }
    });
  }
}
