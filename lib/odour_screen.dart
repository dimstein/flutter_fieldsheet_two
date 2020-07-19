import 'package:flutter/material.dart';

class OdourScreen extends StatefulWidget {
  @override
  _OdourScreenState createState() => _OdourScreenState();
}

class _OdourScreenState extends State<OdourScreen> {
  String dropDownValue = 'Play';

  final cardReference = Flexible(
      flex: 1,
      child: Card(
        elevation: 15,
        color: Colors.blueGrey[200],
        child: ListTile(
          title: Text("Something"),
          subtitle: Text('What is the matter'),
          leading: Text('123456'),
        ),
      ));

  final cardBags = Flexible(
      flex: 1,
      child: Card(
        elevation: 15,
        color: Colors.blueGrey[200],
        child: ListTile(
          title: Text("Something"),
          subtitle: Text('What is the matter'),
          leading: Text('123456'),
        ),
      ));

  final cardExtra = Flexible(
      flex: 2,
      child: Card(
        elevation: 15,
        color: Colors.blueGrey[200],
        child: ListTile(
          title: Text("Something"),
          subtitle: Text('What is the matter'),
          leading: Text('123456'),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Odour Fieldsheet")),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            ListView(
              children: [
                DropdownButton(
                  items: <String>['pool', 'something', 'what', 'end of']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownValue = newValue;
                    });
                  },
                ),
                Row(
                  children: [
                    cardReference,
                    cardBags,
                  ],
                ),
                cardExtra,
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
