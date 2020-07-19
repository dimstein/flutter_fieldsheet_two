import 'package:flutter/material.dart';

class CardBags extends StatelessWidget {
  const CardBags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

        //width: screenSize.width*0.30,
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Bag 1'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Bag 2'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Bag 3'),
          ),
        ],
      ),
    ));
  }
}
