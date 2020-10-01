import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/models/destination.dart';
import 'package:flutter_fieldsheet/services/database.dart';
import 'package:provider/provider.dart';

class NavHomePage extends StatefulWidget {
  final VoidCallback navSubmit;

  const NavHomePage({Key key, this.navSubmit}) : super(key: key);

  @override
  _NavHomePageState createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(allDestinations[_currentIndex].pageTitle),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.lock_open),
              onPressed: () {
                db.logOut();
              })
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: IndexedStack(
              index: _currentIndex,
              children: allDestinations.map<Widget>((Destination destination) {
                return destination.page;
              }).toList(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              backgroundColor: destination.color,
              title: Text(destination.title));
        }).toList(),
      ),
    );
  }
}
