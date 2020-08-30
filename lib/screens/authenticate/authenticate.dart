import 'package:blood_app/screens/authenticate/login.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/login.jpg"),
            fit: BoxFit.contain,
          ),
          Positioned(
              bottom: 110,
              left: 75,
              height: 50.0,
              width: 140.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  print('Login pressed');
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20.0),
                ),
                textColor: Colors.black,
                color: Colors.red[700],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(22.0)),
              )),
          Positioned(
              bottom: 45,
              left: 75,
              height: 50.0,
              width: 140.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 20.0),
                ),
                textColor: Colors.black,
                color: Colors.red[700],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(22.0)),
              ))
        ],
      ),
    );
  }
}
