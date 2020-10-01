import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/LayoutScreen/menu_drawer_widget.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu Page'),
        ),
        drawer: MenuDrawerWidget(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueGrey[200],
          child: Column(
            children: [Text('data'), Text('data'), Text('data'), Text('data')],
          ),
        ));
  }
}
