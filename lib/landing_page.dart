import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_fieldsheet/LayoutScreen/layout_basic.dart';
import 'package:flutter_fieldsheet/sign_in_page.dart';
import 'package:flutter_fieldsheet/text_basic.dart';

class LandingPage extends StatelessWidget {
  final String appTitle;

  const LandingPage({Key key, this.appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            FirebaseUser user = snapshot.data;
            if (user == null) {
              return SignInPage(appTitle: appTitle);
            }
            //return HomePage(user: user);
            return TextBasic();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
