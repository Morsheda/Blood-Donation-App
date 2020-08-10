import 'package:blood_app/screens/authenticate/authenticate.dart';
import 'package:blood_app/screens/pages/blood_bank.dart';
import 'package:blood_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal[400], actions: <Widget>[
        FlatButton.icon(
          icon: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          label: Text(
            'Log out',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () async {
            await _auth.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Authenticate()),
            );
          },
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage("assets/pficon.jpg"),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Pnone number:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Address:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Date of last donation:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.black),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: new BorderRadius.circular(12.0)),
                    ),
                  ]),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '',
              ),
              decoration: BoxDecoration(
                color: Colors.teal[400],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.teal[400],
              ),
              title: Text('Home',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.teal[400],
              ),
              title: Text('My Profile',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.comment,
                color: Colors.teal[400],
              ),
              title: Text('Inbox',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.teal[400],
              ),
              title: Text('Requests',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance,
                color: Colors.teal[400],
              ),
              title: Text('Blood Bank',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BloodBanks()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.teal[400],
              ),
              title: Text('Settings',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.teal[400],
              ),
              title: Text('Log out',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              onTap: () async {
                await _auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Authenticate()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
