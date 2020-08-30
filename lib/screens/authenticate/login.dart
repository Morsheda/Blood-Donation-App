import 'package:blood_app/models/user_management.dart';
import 'package:blood_app/screens/home/home.dart';
import 'package:blood_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  String _name;
  String _age;
  String _bloodGroup;
  String _lastDate;
  String _mobile;
  String _address;
  String _email;
  String _password;
  String _passwordConfirmation;
  String err = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Authservice _auth = Authservice();
  Firestore db = Firestore.instance;

  // Future<void> saveUser(user) async {
  //   db.collection('users').add(user).then((DocumentReference document) {
  //     print(document.documentID);
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  Future<void> saveUser(MyUsers user, docref) async {
    db
        .collection('users')
        .document(docref)
        .setData({
          'name': user.name,
          'age': user.age,
          'bloodGroup': user.bloodGroup,
          'last date of donation': user.lastDate,
          'mobile': user.mobile,
          'address': user.address,
          'email': user.email,
          'password': user.password
        })
        .then((value) {})
        .catchError((e) {
          print(e);
        });
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Name'),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Age'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          _age = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildBloodGroup() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Blood Group'),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        setState(() {
          _bloodGroup = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildLastDonation() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Last date of blood donation'),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        setState(() {
          _lastDate = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildMobile() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Mobile No.'),
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        setState(() {
          _mobile = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Address'),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        setState(() {
          _address = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildPassworConfirmation() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Confirm Password'),
      keyboardType: TextInputType.visiblePassword,
      onChanged: (String value) {
        setState(() => _passwordConfirmation = value);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildName(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildAge(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildBloodGroup(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildLastDonation(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildMobile(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildAddress(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildEmail(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPassword(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPassworConfirmation(),
              ),
              SizedBox(height: 100),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                elevation: 7.0,
                child: Text('SIGN UP', style: TextStyle(fontSize: 18.0)),
                textColor: Colors.white,
                color: Colors.blue[300],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0)),
                onPressed: () async {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  dynamic result = await _auth.registerWithEmailAndPassword(
                      _email, _password);
                  //eituk notun
                  final MyUsers user = MyUsers(
                      name: _name,
                      age: _age,
                      bloodGroup: _bloodGroup,
                      lastDate: _lastDate,
                      mobile: _mobile,
                      address: _address,
                      email: _email,
                      password: _password);
                  saveUser(user, result.uid);
                  //upto this
                  if (result == null) {
                    print('error signing up');
                    setState(() => err = 'Please Enter Valid Informations');
                  } else {
                    print('Successfully signed up');
                    print(result.uid);
                    print(_name);
                    print(_age);
                    print(_bloodGroup);
                    print(_lastDate);
                    print(_mobile);
                    print(_address);
                    print(_email);
                    print(_password);
                    print(_passwordConfirmation);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(docId: result.uid)),
                    );
                  }
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                err,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  String err = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Authservice _auth = Authservice();

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() => _email = value);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      onChanged: (String value) {
        setState(() => _password = value);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildEmail(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPassword(),
              ),
              SizedBox(height: 100),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                elevation: 7.0,
                child: Text('LOGIN', style: TextStyle(fontSize: 18.0)),
                textColor: Colors.white,
                color: Colors.blue[300],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0)),
                onPressed: () async {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  dynamic result =
                      await _auth.singInWithEmailAndPassword(_email, _password);
                  if (result == null) {
                    print('error signing in');
                    setState(() => err = 'Invalid User or Password');
                  } else {
                    print('Successfully logged in');
                    print(result.uid);
                    print(_email);
                    print(_password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(docId: result.uid)),
                    );
                  }
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                err,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
