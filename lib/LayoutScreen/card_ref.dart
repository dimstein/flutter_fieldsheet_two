import 'package:flutter/material.dart';

class CardRef extends StatelessWidget {
  const CardRef({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Reference'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Client'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Site'),
          ),
        ],
      ),
    ));
  }
}
