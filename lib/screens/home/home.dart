import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person), 
            label: Text('logout'),
            onPressed: () async {
             await _auth.signingOut();
            }, 
          )
        ],
      ),
    );
  }
}