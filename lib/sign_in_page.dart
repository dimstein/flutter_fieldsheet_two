import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:load_toast/load_toast.dart';

class SignInPage extends StatefulWidget {
  final String appTitle;

  const SignInPage({Key key, this.appTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailTEC = TextEditingController();

  final TextEditingController _passwordTEC = TextEditingController();

  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTEC.dispose();
    _passwordTEC.dispose();
    super.dispose();
  }

  Future<void> _signInEmail() async {
    showLoadToast(
        backgroundColor: Colors.orange,
        indicatorColor: Colors.orange[900],
        text: 'Attempting');

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailTEC.text.trim(), password: _passwordTEC.text.trim())
          .then((value) => hideLoadToastWithSuccess());
    } catch (e) {
      print("SOMETHING FROM SIGNINEMAIL $e");
      Timer(
          Duration(seconds: 1),
          () => showLoadToast(
              backgroundColor: Colors.red,
              indicatorColor: Colors.red[900],
              text: 'Failed'));
      Timer(Duration(seconds: 2), () => hideLoadToastWithError());
    }
  }

  Future<void> _registerEmail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTEC.text.trim(), password: _passwordTEC.text.trim());
      _signInEmail();
    } catch (e) {
      print('register problem $e');
      Timer(Duration(seconds: 1), () =>
          showLoadToast(
              backgroundColor: Colors.red,
              indicatorColor: Colors.red[900],
              text: 'Failed'
          ));
      Timer(Duration(seconds: 2), () => hideLoadToastWithError());
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailTFF = TextFormField(
      key: Key('emailTFF'),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "email@email.com",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      validator: (value) {
        if (value.isEmpty) {
          return "Enter email";
        }
        return null;
      },
      controller: _emailTEC,
    );

    final passwordTFF = TextFormField(
      key: Key('passwordTFF'),
      keyboardType: TextInputType.number,
      obscureText: true,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      validator: (value) {
        if (value.isEmpty) {
          return "Enter password";
        }
        return null;
      },
      controller: _passwordTEC,
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        key: Key('loginButton'),

        minWidth: MediaQuery
            .of(context)
            .size
            .width * 0.6,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _signInEmail,
        child: Text("Login",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
      ),
    );
    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffA0C7),
      child: MaterialButton(
        key: Key('registerButton'),
        minWidth: MediaQuery
            .of(context)
            .size
            .width * 0.6,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _registerEmail,
        child: Text("Register",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.appTitle,
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 5, 32, 32),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login.jpeg',
                  height: 50,
                  width: 50,
                ),
                SizedBox(height: 10),
                emailTFF,
                SizedBox(height: 10),
                passwordTFF,
                SizedBox(height: 10),
                loginButton,
                SizedBox(height: 10),
                registerButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
