import 'package:flutter/material.dart';

class MenuDrawerWidget extends StatelessWidget {
  final NetworkImage imgCat = NetworkImage(
      'http://www.free-graphics.com/clipart/Animals/Cats/blanket_feline.jpg');
  final NetworkImage imgDog = NetworkImage(
      'http://www.free-graphics.com/clipart/Animals/Dogs/begging.jpg');
  final NetworkImage imgBird = NetworkImage(
      'http://www.free-graphics.com/clipart/Animals/Birds/seagull_tn.jpg');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Draw Header'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              image: DecorationImage(
                  image: imgCat,
                  onError: (exception, stackTrace) =>
                      print('This the onError exception: $exception'),
                  fit: BoxFit.fill),
            ),
            child: ListTile(
              title: Text('Item One'),
              onTap: () {
                print('select number one');
              },
              hoverColor: Colors.purple,
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              image: DecorationImage(
                  image: imgDog,
                  onError: (exception, stackTrace) =>
                      print('This the onError exception: $exception'),
                  fit: BoxFit.fill),
            ),
            child: ListTile(
              title: Text('Item Two'),
              onTap: () {
                print('number two ');
              },
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              image: DecorationImage(
                  image: imgBird,
                  onError: (exception, stackTrace) =>
                      print('This the onError exception: $exception'),
                  fit: BoxFit.fill),
            ),
            child: ListTile(
              title: Text('Item Three'),
              onTap: () {
                print('number three');
              },
            ),
          )
        ],
      ),
    );
  }
}
