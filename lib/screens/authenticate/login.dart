//import 'package:blood_app/models/user_management.dart';
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
  String _mobile;
  String _address;
  String _email;
  String _password;
  String _passwordConfirmation;
  String err = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Authservice _auth = Authservice();
  Firestore db = Firestore.instance;

  // Future<void> saveUser(final user) async {
  //   db.collection('users').add(user).then((DocumentReference document) {
  //     print(document.documentID);
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

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
      obscureText: true,
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
      obscureText: true,
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
              _buildName(),
              _buildAge(),
              _buildBloodGroup(),
              _buildMobile(),
              _buildAddress(),
              _buildEmail(),
              _buildPassword(),
              _buildPassworConfirmation(),
              SizedBox(height: 100),
              RaisedButton(
                padding: EdgeInsets.all(15.0),
                child: Text('SIGN UP', style: TextStyle(fontSize: 18.0)),
                textColor: Colors.black,
                color: Colors.blue[300],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0)),
                onPressed: () async {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  //eituk notun
                  // final MyUsers user = MyUsers(
                  //     name: _name,
                  //     age: _age,
                  //     bloodGroup: _bloodGroup,
                  //     mobile: _mobile,
                  //     address: _address,
                  //     email: _email,
                  //     password: _password);
                  // saveUser(user.toMap());
                  //upto this
                  _formKey.currentState.save();
                  dynamic result = await _auth.registerWithEmailAndPassword(
                      _email, _password);
                  if (result == null) {
                    print('error signing up');
                    setState(() => err = 'Please Enter Valid Informations');
                  } else {
                    print('Successfully signed up');
                    print(_name);
                    print(_age);
                    print(_bloodGroup);
                    print(_mobile);
                    print(_address);
                    print(_email);
                    print(_password);
                    print(_passwordConfirmation);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
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
      obscureText: true,
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
              _buildEmail(),
              _buildPassword(),
              SizedBox(height: 100),
              RaisedButton(
                padding: EdgeInsets.all(15.0),
                child: Text('LOGIN', style: TextStyle(fontSize: 18.0)),
                textColor: Colors.black,
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
                    print(_email);
                    print(_password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
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
