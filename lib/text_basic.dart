import 'package:flutter/material.dart';

class TextBasic extends StatefulWidget {
  @override
  _TextBasicState createState() => _TextBasicState();
}

class _TextBasicState extends State<TextBasic> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('BASIC TEXT SCREEN'),
      ),
      body: Container(
        width: screen.width,
        height: screen.height,
        color: Colors.blueGrey[200],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: [
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
