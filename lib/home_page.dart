import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  const HomePage({Key key, this.user}) : super(key: key);

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //TODO show dialog error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
              onPressed: _signOut,
              child: Text('LOGOUT',
                  style: TextStyle(fontSize: 22, color: Colors.white)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            'Something from the vault via ${user.email}',
            style: TextStyle(fontSize: 28, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
