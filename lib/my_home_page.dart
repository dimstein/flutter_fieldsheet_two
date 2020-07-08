import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  final String appTitle;

  const MyHomePage({Key key, this.appTitle}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTEC.dispose();
    _passwordTEC.dispose();
    super.dispose();
  }

  Future<FirebaseUser> _handleSignIn() async {
    print('${_emailTEC.text} with ${_passwordTEC.text}');
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final emailTFF = TextFormField(
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
        minWidth: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _handleSignIn,
        child: Text("Login",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
      ),
    );
    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffA0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          print('Register Button is pushed');
        },
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
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login.jpeg',
                  height: 100,
                  width: 100,
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
